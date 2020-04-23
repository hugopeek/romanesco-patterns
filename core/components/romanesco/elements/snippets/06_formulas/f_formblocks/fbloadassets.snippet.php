<?php
$assetsPathCSS = $modx->getOption('romanesco.custom_css_path', $scriptProperties, '');
$assetsPathJS = $modx->getOption('romanesco.custom_js_path', $scriptProperties, '');
$assetsPathVendor = $modx->getOption('romanesco.custom_vendor_path', $scriptProperties, '');
$assetsPathDist = $modx->getOption('romanesco.semantic_dist_path', $scriptProperties, '');
$uploadFile = $modx->getOption('uploadFile', $scriptProperties, 0);

// Load Semantic UI form component separately
$modx->regClientCSS($assetsPathDist . '/components/form.min.css');
$modx->regClientCSS($assetsPathDist . '/components/calendar.min.css');

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
if (is_file('assets/js/formblocks.js')) {
    $modx->regClientScript('assets/js/formblocks.js');
}
if (is_file('assets/js/form-validation.js')) {
    $modx->regClientScript('assets/js/form-validation.js');
}

return '';