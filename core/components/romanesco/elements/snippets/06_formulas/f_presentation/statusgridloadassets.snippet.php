<?php
/**
 * statusGridLoadAssets
 *
 */

$assetsPathJS = $modx->getOption('romanesco.custom_js_path', $scriptProperties, '');

// Footer
$modx->regClientScript($assetsPathJS . '/tablesort.js');

return '';
