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
use MODX\Revolution\modTemplate;
use FractalFarming\Romanesco\Romanesco;
use Spatie\SchemaOrg\Schema;
use Wa72\HtmlPageDom\HtmlPageCrawler;

if (!($modx->romanesco instanceof Romanesco)) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[Romanesco3x] Romanesco service has wrong type');
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

        // Assorted array of relevant data
        $data = $romanesco->getSchemaOptions([
            'pageType' => 'WebPage',
            'orgType' => 'Organization',
        ]);

        // Reference the graph object initialized in the Romanesco class
        $graph = &$romanesco->structuredData;

        // Establish the kind of template being used
        $query = $modx
            ->newQuery(modTemplate::class, [
                'id' => $modx->resource->get('template')
            ])
            ->select('templatename')
            ->prepare()
        ;
        $template = $modx->getValue($query);

        // Set appropriate page type for each template
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
                break;
        }

        // Add initial data types to each page
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
        $graph
            ->{$data['pageType']}()
            ->identifier($data['url'])
            ->name($data['longtitle'] ?: $data['pagetitle'])
            ->description($data['description'] ?: strip_tags($data['introtext']))
            ->url($data['url'])
            ->inLanguage($data['cultureKey'])
            ->isPartOf(Schema::webSite()
                ->identifier($data['siteURL'] . '#website')
            )
        ;

        break;

    case 'OnWebPagePrerender':
        $graph = &$romanesco->structuredData;
        $data = $romanesco->getSchemaOptions();

        $modx->runSnippet('structuredDataTheme', ['data' => $data]);

        // Add consolidated JSON-LD graph to the HTML
        // Setting a placeholder or using regClientStartupHtmlBlock doesn't work
        //  here, so we're relying on our trusted friend HtmlPageDom again.
        $content = &$modx->resource->_output;
        $dom = new HtmlPageCrawler($content);

        $dom->filter('script#structured-data')
            ->setInnerHtml(json_encode($graph, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT))
        ;

        $content = $dom->saveHTML();

        break;
}