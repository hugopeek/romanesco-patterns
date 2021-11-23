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

$corePath = $modx->getOption('htmlpagedom.core_path', null, $modx->getOption('core_path') . 'components/htmlpagedom/');
$tpl = $modx->getOption('tpl', $scriptProperties, 'externalNavItemLabel');

if (!class_exists('\Wa72\HtmlPageDom\HtmlPageCrawler')) {
    require $corePath . 'vendor/autoload.php';
}

use \Wa72\HtmlPageDom\HtmlPageCrawler;

switch ($modx->event->name) {
    case 'OnWebPagePrerender':

        // Get processed output of resource
        $content = &$modx->resource->_output;

        // Generate links if requested
        if ($modx->resource->getTVValue('auto_references')) {
            $corePath = $modx->getOption('romanescobackyard.core_path', null, $modx->getOption('core_path') . 'components/romanescobackyard/');
            $romanesco = $modx->getService('romanesco','Romanesco', $corePath . 'model/romanescobackyard/', array('core_path' => $corePath));
            if (!($romanesco instanceof Romanesco)) {
                $modx->log(modX::LOG_LEVEL_ERROR, '[Romanesco] Class not found!');
                return;
            }

            // Get external links for this resource
            $linkObject = $modx->getIterator('rmExternalLink', [
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