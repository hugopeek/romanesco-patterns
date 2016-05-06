<?php
/**
 * statusGridLoadAssets
 *
 */

$assetsPath = $modx->getOption('patternlab.custom_js_path');

// Footer
$modx->regClientScript($assetsPath . '/tablesort.min.js');