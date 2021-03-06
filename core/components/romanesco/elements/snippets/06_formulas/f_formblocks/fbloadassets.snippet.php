<?php
/**
 * fbLoadAssets snippet
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
$uploadFile = $modx->getOption('uploadFile', $scriptProperties, 0);

// Load strings to insert in asset paths when cache busting is enabled
$cacheBusterCSS = $romanesco->getCacheBustingString('CSS');
$cacheBusterJS = $romanesco->getCacheBustingString('JS');

// Load Semantic UI form component separately (and async if critical CSS is enabled)
if (!$romanesco->getConfigSetting('critical_css', $modx->resource->get('context_key'))) {
    $modx->regClientCSS($assetsPathDist . '/components/form.min' . $cacheBusterCSS . '.css');
    $modx->regClientCSS($assetsPathDist . '/components/calendar.min' . $cacheBusterCSS . '.css');
} else {
    $modx->regClientStartupHTMLBlock('<link rel="stylesheet" href="assets/semantic/dist/components/form.min' . $cacheBusterCSS . '.css" type="text/css" media="print" onload="this.media=\'all\'">');
    $modx->regClientStartupHTMLBlock('<link rel="stylesheet" href="assets/semantic/dist/components/calendar.min' . $cacheBusterCSS . '.css" type="text/css" media="print" onload="this.media=\'all\'">');
}

// Load FormBlocks JS in footer
$modx->regClientScript($assetsPathDist . '/components/form.min' . $cacheBusterJS . '.js');
$modx->regClientScript($assetsPathDist . '/components/calendar.min' . $cacheBusterJS . '.js');
$modx->regClientScript($assetsPathJS . '/formblocks.min' . $cacheBusterJS . '.js');

// Load additional assets for file upload field, if present
if ($uploadFile) {
    $modx->regClientScript($assetsPathVendor . '/arrive/arrive.min' . $cacheBusterJS . '.js');
    $modx->regClientScript($assetsPathJS . '/fileupload.min' . $cacheBusterJS . '.js');
}

// Load custom assets, if present
// @todo: make this more dynamic
if (is_file('assets/js/formblocks.min.js')) {
    $modx->regClientScript('assets/js/formblocks.min' . $cacheBusterJS . '.js');
} elseif (is_file('assets/js/formblocks.js')) {
    $modx->regClientScript('assets/js/formblocks' . $cacheBusterJS . '.js');
}
if (is_file('assets/js/form-validation.min.js')) {
    $modx->regClientScript('assets/js/form-validation.min' . $cacheBusterJS . '.js');
} elseif (is_file('assets/js/form-validation.js')) {
    $modx->regClientScript('assets/js/form-validation' . $cacheBusterJS . '.js');
}

return '';