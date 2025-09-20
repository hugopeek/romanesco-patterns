<?php
/**
 * AutomaticReferences plugin
 *
 * Turn references to an external link (the ones you created under TVs > Links)
 * into an actual link. Links are referenced by their number value and must be
 * enclosed in square brackets: [12].
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @package romanesco
 */

use FractalFarming\Romanesco\Romanesco;
use Wa72\HtmlPageDom\HtmlPageCrawler;

$tpl = $modx->getOption('tpl', $scriptProperties, 'externalNavItemLabel');

switch ($modx->event->name) {
    case 'OnWebPagePrerender':

        // Get processed output of resource
        $content = &$modx->resource->_output;

        // Cached DOM output already includes references
        $cacheManager = $modx->getCacheManager();
        $cacheElementKey = '/dom.'. hash('xxh3', $_SERVER['REQUEST_URI']);
        $cacheOptions = [
            xPDO::OPT_CACHE_KEY => 'resource/' . $modx->resource->getCacheKey()
        ];
        $cachedOutput = $cacheManager->get($cacheElementKey, $cacheOptions);
        $isLoggedIn = $modx->user->hasSessionContext($modx->context->get('key'));
        if ($cachedOutput && !$isLoggedIn) {
            $modx->log(modX::LOG_LEVEL_DEBUG, '[Romanesco3x] Loading references from cache');
            break;
        }

        // Generate links if requested
        if ($modx->resource->getTVValue('auto_references')) {
            /** @var Romanesco $romanesco */
            try {
                $romanesco = $modx->services->get('romanesco');
            } catch (\Psr\Container\NotFoundExceptionInterface $e) {
                $modx->log(modX::LOG_LEVEL_ERROR, '[Romanesco3x] ' . $e->getMessage());
            }

            // Get external links for this resource
            $linkObject = $modx->getIterator('FractalFarming\Romanesco\Model\LinkExternal', [
                'resource_id' => $modx->resource->get('id'),
                'deleted' => 0
            ]);

            if (!is_object($linkObject)) break;

            // Prepare array with link tags
            $links = [];
            foreach ($linkObject as $link) {
                $links[$link->get('number')] = $modx->getChunk($tpl, $link->toArray());
            }

            // Feed output to HtmlPageDom
            $dom = new HtmlPageCrawler($content);

            // Search the content area for references
            $dom->filter('#content')
                ->filter('p,li')
                ->each(function (HtmlPageCrawler $node) use ($links) {
                    $text = $node->getInnerHtml();

                    // Only accept numeric values inside square brackets
                    preg_match_all('/\[[0-9]+\]/', $text, $matches);

                    // Filter duplicate matches to avoid glitches
                    $matches = array_unique($matches[0]);

                    if (!$matches) return true;

                    foreach ($matches as $match) {
                        $number = filter_var($match, FILTER_SANITIZE_NUMBER_INT);
                        $text = str_replace($match, $links[$number], $text);
                    }

                    $node->setInnerHtml($text);
                    return true;
                })
            ;

            $content = $dom->saveHTML();
        }

        break;
}

return true;