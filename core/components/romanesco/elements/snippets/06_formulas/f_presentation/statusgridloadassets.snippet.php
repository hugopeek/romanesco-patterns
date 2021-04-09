<?php
/**
 * statusGridLoadAssets
 *
 * @var modX $modx
 * @var array $scriptProperties
 *
 * @package romanesco
 */

$corePath = $modx->getOption('romanescobackyard.core_path', null, $modx->getOption('core_path') . 'components/romanescobackyard/');
$romanesco = $modx->getService('romanesco','Romanesco',$corePath . 'model/romanescobackyard/',array('core_path' => $corePath));
if (!($romanesco instanceof Romanesco)) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[Romanesco] Class not found!');
    return;
}

$assetsPathCSS = $modx->getOption('romanesco.semantic_css_path', $scriptProperties, '');
$assetsPathJS = $modx->getOption('romanesco.semantic_js_path', $scriptProperties, '');
$assetsPathVendor = $modx->getOption('romanesco.semantic_vendor_path', $scriptProperties, '');
$assetsPathDist = $modx->getOption('romanesco.semantic_dist_path', $scriptProperties, '');

// Load strings to insert in asset paths when cache busting is enabled
$cacheBusterCSS = $romanesco->getCacheBustingString('CSS');
$cacheBusterJS = $romanesco->getCacheBustingString('JS');

// Header
$modx->regClientCSS($assetsPathDist . '/components/step.min' . $cacheBusterCSS . '.css');
$modx->regClientCSS($assetsPathDist . '/components/modal.min' . $cacheBusterCSS . '.css');

// Footer
$modx->regClientScript($assetsPathDist . '/components/modal.min' . $cacheBusterJS . '.js');
$modx->regClientScript($assetsPathVendor . '/tablesort/tablesort' . $cacheBusterJS . '.js');

return '';