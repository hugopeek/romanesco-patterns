<?php
/**
 *
 */

$corePath = $modx->getOption('htmlpagedom.core_path', null, $modx->getOption('core_path') . 'components/htmlpagedom/');
$tpl = $modx->getOption('tpl', $scriptProperties, 'tocNavItem');

if (!class_exists('\Wa72\HtmlPageDom\HtmlPageCrawler')) {
    require $corePath . 'vendor/autoload.php';
}

use \Wa72\HtmlPageDom\HtmlPageCrawler;


// Check if content type is text/html
//if ($modx->resource->get('content_type') !== 1) {
//    return '';
//}

// Get processed output of resource
$content = $modx->resource->_content;
$resourceURI = $modx->resource->get('uri');

// Feed output to HtmlPageDom
$dom = new HtmlPageCrawler($content);

// Do your thing
$toc = $dom
    ->filter('h1,h2,h3,h4,h5,h6')
    ->each(function(HtmlPageCrawler $node){
        $text = $node->getInnerHtml();
        $anchor = $node->getAttribute('id');
        $level = $node->nodeName();

        return array(
            "text" => $text,
            "anchor" => $anchor,
            "level" => $level,
        );
    })
;

$idx = 0;

foreach ($toc as $index => $item) {
    $output[] = $modx->getChunk($tpl, array(
        'link' => $resourceURI . '#' . $item['anchor'],
        'menutitle' => $item['text'],
        'classnames' => $item['level'],
        'idx' => $idx++,
    ));
}

//$toc->html();

return implode(array_unique($output));