<?php
/**
 * TableOfContents plugin
 *
 * Generate a menu with internal links to all headings in the content.
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @package romanesco
 */

$corePath = $modx->getOption('htmlpagedom.core_path', null, $modx->getOption('core_path') . 'components/htmlpagedom/');
$enabledTemplates = explode(',', $modx->getOption('romanesco.toc_enabled_templates', null, '0'));
$template = $modx->resource->get('template');
$tpl = $modx->getOption('tpl', $scriptProperties, 'tocNavItem');

// Abort if resource template is not a ToC-enabled template
if (!in_array($template, $enabledTemplates)) {
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
            $dom->filter('#content')
                ->filter('h1,h2,h3,h4,h5,h6')
                ->each(function (HtmlPageCrawler $node) {
                    $text = $node->getInnerHtml();
                    $anchor = $node->getAttribute('id');

                    // This is only needed if no anchor is currently present
                    if (!isset($anchor)) {
                        $text = strip_tags($text); // strip HTML
                        $text = strtolower($text); // convert to lowercase
                        $text = preg_replace('/[^.A-Za-z0-9 _-]/', '', $text); // strip non-alphanumeric characters
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
            ->filter('#content')
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
        $output = array();
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