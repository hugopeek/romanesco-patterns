<?php
/**
 * tableOfContents snippet
 *
 * Not to be confused with the ToC plugin. The plugin takes care of generating
 * the menu items, because this needs to be done during the rendering process.
 *
 * This snippet only sets a few placeholders for the plugin to pick up.
 *
 * The target attribute is required. Without it, no ToC menu is created.
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @package romanesco
 */

$tpl = $modx->getOption('tpl', $scriptProperties, '');
$target = $modx->getOption('target', $scriptProperties, '');

if ($target) {
    $modx->setPlaceholder('toc.target', $target);
} else {
    return '';
}

if ($tpl) $modx->setPlaceholder('toc.tpl', $tpl);