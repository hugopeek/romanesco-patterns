<?php
/**
 * statusGridLoadAssets
 *
 */

$assetsPathJS = $modx->getOption('patternlab.custom_js_path');

// Footer
$modx->regClientScript($assetsPathJS . '/tablesort.js');