<?php
/**
 * tabsGenerateNav
 *
 * Create tab buttons based on the tab content's HTML.
 * Each content field contains data attributes with the correct text for each heading.
 *
 * Many thanks to @christianseel for the original idea and code.
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var string $input
 * @var string $options
 */

if (!class_exists(Wa72\HtmlPageDom\HtmlPageCrawler::class)) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[HtmlPageDom] Class not found!');
    return;
}

use Wa72\HtmlPageDom\HtmlPageCrawler;

$input = $modx->getOption('input', $scriptProperties, $input);
$tpl = $modx->getOption('tpl', $scriptProperties, 'tabsNavLeft');
$rowTpl = $modx->getOption('rowTpl', $scriptProperties, 'tabsNavItem');
$tplIcon = $modx->getOption('tplIcon', $scriptProperties, 'tabsNavItemIcon');

$prefix = $modx->getOption('prefix', $scriptProperties, '');
$uid = $modx->getOption('uid', $scriptProperties, '');
$placeholder = $modx->getOption('toPlaceholder', $scriptProperties, false);

$dom = new HtmlPageCrawler($input);

// Only include items with reference to a tab
$tabHeaders = $dom->filter('.item')->each(function(HtmlPageCrawler $node) use ($uid, $modx) {
    if (!$node->getAttribute('data-tab')) {
        return '';
    }
    return $node;
});

// Fetch tab content
$tabSegments = $dom->filter('.tab.segment');

return $modx->getChunk($tpl, [
    'menu' => implode('',$tabHeaders),
    'segments' => $tabSegments . PHP_EOL,
    'tabs_total' => count($tabHeaders),
    'uid' => $uid,
]);