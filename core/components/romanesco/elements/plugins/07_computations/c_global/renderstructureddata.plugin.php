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
        $data = $romanesco->getSchemaOptions();

        // Reference the graph object initialized in the Romanesco class
        $graph = &$romanesco->structuredData;

        // Add initial data types to each page
        $graph
            ->webSite()
            ->identifier($data['siteURL'] . "#website")
            ->name($data['siteName'])
            ->url($data['siteURL'])
            ->publisher(Schema::{$data['clientType']}()
                ->identifier($data['siteURL'] . '#' . $data['clientType'])
            )
        ;
        $graph
            ->webPage()
            ->identifier($data['url'])
            ->name($data['longtitle'] ?: $data['pagetitle'])
            ->description($data['description'] ?: strip_tags($data['introtext']))
            ->url($data['url'])
            ->inLanguage($romanesco->getContextSetting('cultureKey', 'web'))
            ->isPartOf(Schema::webSite()
                ->identifier($data['siteURL'] . '#website')
            )
        ;

        if ($data['clientType'] == 'organization') {
            $graph
                ->organization()
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
                    ->url(str_replace("//", "/", $data['siteURL'] . $data['logoPath']))
                    ->caption($data['siteName'])
                )
                ->image(Schema::imageObject()
                    ->identifier($data['siteURL'] . "#image")

                )
            ;
        }

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

        $dom->filter('head > script#structured-data')
            ->setInnerHtml(json_encode($graph, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT));
        ;

        $content = $dom->saveHTML();

        break;
}