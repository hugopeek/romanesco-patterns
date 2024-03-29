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

$input = $modx->getOption('input', $scriptProperties, $input);
$tpl = $modx->getOption('tpl', $scriptProperties, 'tabsNavItem');
$tplIcon = $modx->getOption('tplIcon', $scriptProperties, 'tabsNavItemIcon');

$prefix = $modx->getOption('prefix', $scriptProperties, '');
$placeholder = $modx->getOption('toPlaceholder', $scriptProperties, false);

$doc = new DOMDocument();

// Set error level to suppress warnings in log over special characters in HTML
$internalErrors = libxml_use_internal_errors(true);

// Load HTML
$doc->loadHTML('<meta http-equiv="content-type" content="text/html; charset=utf-8">' . $input);

// Restore error level
$internalErrors = libxml_use_internal_errors(false);

$divs = $doc->getElementsByTagName('div'); // Little flaky.. If div element changes, navigation breaks.

$tabs = array();

$idx = 1;
foreach($divs as $div) {
    if ($div->hasAttribute('data-tab')) {
        $tabs[$div->getAttribute('data-tab')] = array(
            'heading' => $div->getAttribute('data-heading'),
            'level' => $div->getAttribute('data-level'),
            'subtitle' => $div->getAttribute('data-subtitle'),
            'icon' => $div->getAttribute('data-icon')
        );
    }
}

$tabHeaders = '';

$idx = 1;
foreach($tabs as $tab) {
    if ($tab['icon']) {
        $tpl = $tplIcon;
    }

    $properties = array(
        'idx' => $idx,
        'heading' => $tab['heading'],
        'level' => $tab['level'],
        'subtitle' => $tab['subtitle'],
        'icon' => $tab['icon'],
    );

    $tabHeaders .= $modx->getChunk($tpl, $properties);
    $idx++;
}

// Return placeholder with idx, so tab menu can be justified
$modx->toPlaceholder('tabs_total', $idx - 1);

// Output either to placeholder, or directly
if ($placeholder) {
    $modx->toPlaceholder('pl', $prefix);
    $modx->toPlaceholder($placeholder, $tabHeaders, $prefix);
    return '';
}
return $tabHeaders;