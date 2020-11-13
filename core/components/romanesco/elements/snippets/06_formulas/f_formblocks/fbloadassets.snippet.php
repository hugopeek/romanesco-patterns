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

// Load Semantic UI form component separately (and async if critical CSS is enabled)
if (!$romanesco->getConfigSetting('critical_css', $modx->resource->get('context_key'))) {
    $modx->regClientCSS($assetsPathDist . '/components/form.min.css');
    $modx->regClientCSS($assetsPathDist . '/components/calendar.min.css');
} else {
    $modx->regClientStartupHTMLBlock('<link rel="stylesheet" href="assets/semantic/dist/components/form.min.css" type="text/css" media="print" onload="this.media=\'all\'">');
    $modx->regClientStartupHTMLBlock('<link rel="stylesheet" href="assets/semantic/dist/components/calendar.min.css" type="text/css" media="print" onload="this.media=\'all\'">');
}

// Load FormBlocks JS in footer
$modx->regClientScript($assetsPathDist . '/components/form.min.js');
$modx->regClientScript($assetsPathDist . '/components/calendar.min.js');
$modx->regClientScript($assetsPathJS . '/formblocks.js');

// Load additional assets for file upload field, if present
if ($uploadFile) {
    $modx->regClientScript($assetsPathVendor . '/arrive/arrive.min.js');
    $modx->regClientScript($assetsPathJS . '/fileupload.js');
}

// Load custom assets, if present
if (is_file('assets/js/formblocks.min.js')) {
    $modx->regClientScript('assets/js/formblocks.min.js');
} elseif (is_file('assets/js/formblocks.js')) {
    $modx->regClientScript('assets/js/formblocks.js');
}
if (is_file('assets/js/form-validation.min.js')) {
    $modx->regClientScript('assets/js/form-validation.min.js');
} elseif (is_file('assets/js/form-validation.js')) {
    $modx->regClientScript('assets/js/form-validation.js');
}

return '';