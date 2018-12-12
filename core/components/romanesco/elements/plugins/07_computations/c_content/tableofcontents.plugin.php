<?php
/**
 *
 */

$corePath = $modx->getOption('htmlpagedom.core_path', null, $modx->getOption('core_path') . 'components/htmlpagedom/');
$template = $modx->resource->get('template');
$tpl = $modx->getOption('tpl', $scriptProperties, 'tocNavItem');

// Get template name
$query = $modx->newQuery('modTemplate');
$query->where(array(
    'id' => $template
));
$query->select('templatename');
$templateName = $modx->getValue($query->prepare());

// Abort if resource template is not a ToC template
if (strpos($templateName, 'ToC') == false) {
    return true;
}

// Load HtmlPageDom
if (!class_exists('\Wa72\HtmlPageDom\HtmlPageCrawler')) {
    require $corePath . 'vendor/autoload.php';
}

use \Wa72\HtmlPageDom\HtmlPageCrawler;

switch ($modx->event->name) {
    case 'OnWebPagePrerender':

        // Get processed output of resource
        $content = &$modx->resource->_output;
        $resourceURI = $modx->resource->get('uri');

        // Feed output to HtmlPageDom
        $dom = new HtmlPageCrawler($content);

        // Generate anchors if requested
        if ($modx->resource->getTVValue('auto_anchors')) {
            $dom->filter('h1,h2,h3,h4,h5,h6')
                ->each(function (HtmlPageCrawler $node) {
                    $text = $node->getInnerHtml();
                    $anchor = $node->getAttribute('id');

                    // This is only needed if no anchor is currently present
                    if (!isset($anchor)) {
                        $text = strip_tags($text); // strip HTML
                        $text = strtolower($text); // convert to lowercase
                        $text = preg_replace('/[^\.A-Za-z0-9 _-]/', '', $text); // strip non-alphanumeric characters
                        $text = preg_replace('/\s+/', '-', $text); // convert white-space to dash
                        $text = preg_replace('/-+/', '-', $text);  // convert multiple dashes to one
                        $text = trim($text, '-'); // trim excess

                        $node->setAttribute('id', $text);
                        return true;
                    }

                    return false;
                }
            );
        }

        // Get all headings on the page
        $toc = $dom
            ->filter('h1,h2,h3,h4,h5,h6')
            ->each(function (HtmlPageCrawler $node) {
                $text = $node->getInnerHtml();
                $anchor = $node->getAttribute('id');
                $level = $node->nodeName();

                if (isset($anchor)) {
                    return array(
                        "text" => $text,
                        "anchor" => $anchor,
                        "level" => $level,
                    );
                }

                return false;
            });

        // Remove empty headings from array (why are they there?)
        $toc = array_filter($toc);

        // Create menu
        $idx = 0;
        foreach ($toc as $index => $item) {
            $output[] = $modx->getChunk($tpl, array(
                'link' => $resourceURI . '#' . $item['anchor'],
                'menutitle' => $item['text'],
                'classnames' => $item['level'],
                'idx' => $idx++,
            ));
        }

        // Append menu to HTML container
        $dom->filter('#submenu.toc')->append(implode($output));
        $content = $dom->saveHTML();

        break;

}

return true;