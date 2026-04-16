<?php
/**
 * RenderStructuredData
 *
 * Turn given schema.org properties into a proper JSON-LD array.
 *
 * All types are collected in a central graph object, which is initiated in the
 * Romanesco class.
 *
 * This plugin sets the initial data types for each page. Additional data can be
 * added via snippets, as long as they load the graph by reference. The final
 * JSON-LD output is added to the head by the renderStructuredData snippet.
 *
 * @depends https://github.com/spatie/schema-org
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var Romanesco $romanesco
 * @package romanesco
 */

use MODX\Revolution\modX;
use MODX\Revolution\modChunk;
use MODX\Revolution\modTemplate;
use FractalFarming\Romanesco\Romanesco;
use FractalFarming\Romanesco\Model\SocialConnectResource;
use Spatie\SchemaOrg\Schema;
use Wa72\HtmlPageDom\HtmlPageCrawler;

if (!($modx->romanesco instanceof Romanesco)) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[Romanesco3x] Romanesco service could not be loaded');
    return;
}
$romanesco = $modx->romanesco;

// Kill switch
if (!$romanesco->getConfigSetting('structured_data')) return;

switch ($modx->event->name) {
    case 'OnLoadWebDocument':

        // Get processed output of resource
        $content = &$modx->resource->_content;

        // Cached DOM output already includes structured data
        if ($content) {
            $cacheManager = $modx->getCacheManager();
            $cacheElementKey = '/dom.'. hash('xxh3', $_SERVER['REQUEST_URI']);
            $cacheOptions = [
                xPDO::OPT_CACHE_KEY => 'resource/' . $modx->resource->getCacheKey()
            ];
            $cachedOutput = $cacheManager->get($cacheElementKey, $cacheOptions);
            $isLoggedIn = $modx->user->hasSessionContext($modx->context->get('key'));
            if ($cachedOutput && !$isLoggedIn) {
                $modx->log(modX::LOG_LEVEL_DEBUG, '[Romanesco3x] Loading structured data from cache');
                break;
            }
        }

        // Get media source ID for logo path setting
        $cgSetting = $modx->getObject('cgSetting', ['key' => 'logo_path']);
        $logoPathMediaSourceID = (int)$cgSetting?->get('source') ?? '';

        // Assorted array of relevant data
        $data = [
            // System / context
            'siteStart' => $modx->getOption('site_start'),
            'siteName' => $modx->getOption('site_name'),
            'siteURL' => $modx->getOption('site_url'),
            'httpHost' => $modx->getOption('http_host'),
            'cultureKey' => $romanesco->getContextSetting('cultureKey', $modx->resource->get('context_key') ?? 'web', 'en'),

            // ClientConfig
            'clientType' => $romanesco->getConfigSetting('client_type'),
            'clientPhone' => $romanesco->getConfigSetting('client_phone'),
            'clientEmail' => $romanesco->getConfigSetting('client_email'),
            'clientAddressStreet' => $romanesco->getConfigSetting('client_address_street'),
            'clientAddressLocality' => $romanesco->getConfigSetting('client_address_locality'),
            'clientAddressRegion' => $romanesco->getConfigSetting('client_address_region'),
            'clientAddressCountry' => $romanesco->getConfigSetting('client_address_country'),
            'clientAddressPostcode' => $romanesco->getConfigSetting('client_address_postcode'),
            'clientAddressExtended' => $romanesco->getConfigSetting('client_address_extended'),
            'logoPath' => $romanesco->getMediaSourcePath($logoPathMediaSourceID, $romanesco->getConfigSetting('logo_path')),

            // Resource (if available)
            'pagetitle' => $modx->resource->get('pagetitle') ?? '',
            'longtitle' => $modx->resource->get('longtitle') ?? '',
            'menutitle' => $modx->resource->get('menutitle') ?? '',
            'description' => $modx->resource->get('description') ?? '',
            'introtext' => strip_tags($modx->resource->get('introtext')) ?? '',
            'url' => $modx->resource->get('id') ? $modx->makeUrl($modx->resource->get('id'), null, null, 'full') : '',
            'context' => $modx->resource->get('context_key') ?? '',
            'publishedon' => $modx->resource->get('publishedon') ?? '',
            'editedon' => $modx->resource->get('editedon') ?? '',

            // Schema types
            'pageType' => 'WebPage',
            'orgType' => 'Organization',
        ];

        // Initialize main types
        $webPage = Schema::webPage();

        // Set appropriate data for each template
        $query = $modx
            ->newQuery(modTemplate::class, [
                'id' => $modx->resource->get('template')
            ])
            ->select('templatename')
            ->prepare()
        ;
        $template = $modx->getValue($query);

        switch ($template) {
            case str_contains($template, 'Overview'):
                $data['pageType'] = 'CollectionPage';
                break;

            case str_contains($template, 'Detail'):
                $data['pageType'] = 'WebPage';
                break;

            case str_contains($template, 'Article'):
                $data['pageType'] = 'Article';
                break;

            case str_contains($template, 'Person'):
                $data['pageType'] = 'ProfilePage';

                // Get profile picture
                $data['personImage'] = '';
                if ($image = $modx->resource->getTVValue('person_image')) {
                    $imagePath = $modx->runSnippet('ImagePlus', [
                        'value' => $image,
                        'options' => 'w=800&q=85&zc=1',
                    ]);
                    $data['personImage'] = $data['siteURL'] . ltrim($imagePath, '/');
                }

                // Get social connections attached to resource
                $resourceFields = $modx->resource->toArray();
                $templateVars = $modx->resource->getTemplateVars();
                foreach ($templateVars as $tv) {
                    $resourceFields[$tv->get('name')] = $tv->get('value');
                }
                $socialConnections = $modx->getCollection(SocialConnectResource::class, [
                    'parent_id' => $modx->resource->get('id'),
                ]);
                $data['sameAs'] = [];
                foreach ($socialConnections as $connection) {
                    $urlContent = $connection->get('url');
                    $chunk = $modx->newObject(modChunk::class);
                    $chunk->setContent($urlContent);
                    $chunk->setProperties($resourceFields);
                    $chunk->setCacheable(false);
                    $data['sameAs'][] = $chunk->process([
                        'name' => $connection->get('name'),
                        'title' => $connection->get('title'),
                        'username' => $connection->get('username'),
                    ]);
                }

                // Get data from TVs
                $data[] = [
                    'personFirstname' => $modx->resource->getTVValue('person_firstname') ?? '',
                    'personLastname' => $modx->resource->getTVValue('person_lastname') ?? '',
                    'personJobtitle' => $modx->resource->getTVValue('person_jobtitle') ?? '',
                    'personEmail' => $modx->resource->getTVValue('contact_email') ?? '',
                    'personPhone' => $modx->resource->getTVValue('contact_phone') ?? '',
                ];

                $webPage = Schema::profilePage();
                $webPage
                    ->mainEntity(Schema::person()
                        ->name($data['pagetitle'])
                        ->email($data['personEmail'])
                        ->telephone($data['personPhone'])
                        ->jobTitle($data['personJobtitle'])
                        ->sameAs($data['sameAs'])
                        ->image(Schema::imageObject()
                            ->url($data['personImage'])
                        )
                    )
                ;
                break;
        }

        // Reference the graph object initialized in the Romanesco class
        $graph = &$romanesco->structuredData;

        // Website and Organization are only added on homepage
        if ($modx->resource->get('id') == $data['siteStart']) {
            $graph
                ->webSite()
                ->identifier($data['siteURL'] . "#website")
                ->name($data['siteName'])
                ->url($data['siteURL'])
                ->publisher(Schema::{$data['clientType']}()
                    ->identifier($data['siteURL'] . '#' . $data['clientType'])
                )
            ;
            if ($data['clientType'] == 'organization') {
                $graph
                    ->{$data['orgType']}()
                    ->identifier($data['siteURL'] . '#organization')
                    ->name($data['siteName'])
                    ->url($data['siteURL'])
                    ->telephone($data['clientPhone'])
                    ->email($data['clientEmail'])
                    ->address(Schema::postalAddress()
                        ->streetAddress($data['clientAddressStreet'])
                        ->addressLocality($data['clientAddressLocality'])
                        ->addressRegion($data['clientAddressRegion'])
                        ->addressCountry($data['clientAddressCountry'])
                        ->postalCode($data['clientAddressPostcode'])
                    )
                    ->logo(Schema::imageObject()
                        ->identifier($data['siteURL'] . "#logo")
                        ->url($data['siteURL'] . $data['logoPath'])
                        ->caption($data['siteName'] . " logo")
                    )
                    ->image(Schema::imageObject()
                        ->identifier($data['siteURL'] . "#image")
                        //@todo: which image(s) to fetch here?
                    )
                ;
            }
            //@todo: Person type is not correct here
            if ($data['clientType'] == 'person') {
                $graph
                    ->person()
                    ->identifier($data['siteURL'] . '#person')
                    ->name($data['siteName'])
                    ->url($data['siteURL'])
                    ->telephone($data['clientPhone'])
                    ->email($data['clientEmail'])
                ;
            }
        }

        // Web page
        $webPage
            ->identifier($data['url'])
            ->name($data['longtitle'] ?? $data['pagetitle'])
            ->description($data['description'] ?? strip_tags($data['introtext']))
            ->url($data['url'])
            ->inLanguage($data['cultureKey'])
            ->isPartOf(Schema::webSite()
                ->identifier($data['siteURL'] . '#website')
            )
        ;
        $graph->add($webPage);

        // Store options array for reuse
        $romanesco->setSchemaOptions($data);

        break;

    case 'OnWebPagePrerender':
        $graph = &$romanesco->structuredData;
        $data = $romanesco->getSchemaOptions();

        // Load custom data (runsnippet doesn't run if snippet doesn't snip)
        $modx->runSnippet('structuredDataTheme', ['data' => $data]);

        // Add consolidated JSON-LD graph to the HTML
        // Setting a placeholder or using regClientStartupHtmlBlock doesn't work
        //  here, so we're relying on our trusted friend HtmlPageDom again.
        $content = &$modx->resource->_output;
        $dom = new HtmlPageCrawler($content);

        $dom->filter('script#structured-data')
            ->setInnerHtml(json_encode($graph, JSON_UNESCAPED_SLASHES))
        ;

        $content = $dom->saveHTML();

        break;
}