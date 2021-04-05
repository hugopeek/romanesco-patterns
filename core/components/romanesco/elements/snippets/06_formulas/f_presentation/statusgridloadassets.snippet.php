<?php
/**
 * statusGridLoadAssets
 *
 */

$assetsPathCSS = $modx->getOption('romanesco.semantic_css_path', $scriptProperties, '');
$assetsPathJS = $modx->getOption('romanesco.semantic_js_path', $scriptProperties, '');
$assetsPathVendor = $modx->getOption('romanesco.semantic_vendor_path', $scriptProperties, '');
$assetsPathDist = $modx->getOption('romanesco.semantic_dist_path', $scriptProperties, '');

//$cacheBuster = $modx->getObject('cgSetting', array('key' => 'cache_buster'));
//
//if (is_object($cacheBuster) && $cacheBuster->get('value') == 1) {
//    $versionCSS = $modx->getObject('modSystemSetting', array('key' => 'romanesco.assets_version_css'));
//    $versionJS = $modx->getObject('modSystemSetting', array('key' => 'romanesco.assets_version_js'));
//
//    if ($versionCSS && $versionJS) {
//        $cacheBusterCSS = '.' . str_replace('.','', $versionCSS->get('value'));
//        $cacheBusterJS = '.' . str_replace('.','', $versionJS->get('value'));
//    }
//}

// Header
$modx->regClientCSS($assetsPathDist . '/components/step.min.css');
$modx->regClientCSS($assetsPathDist . '/components/modal.min.css');

// Footer
$modx->regClientScript($assetsPathDist . '/components/modal.min.js');
$modx->regClientScript($assetsPathVendor . '/tablesort/tablesort.js');

return '';