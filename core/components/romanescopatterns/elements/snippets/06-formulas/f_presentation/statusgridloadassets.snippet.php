<?php
/**
 * statusGridLoadAssets
 *
 */

$assetsPathJS = $modx->getOption('romanesco.custom_js_path');

// Footer
$modx->regClientScript($assetsPathJS . '/tablesort.js');