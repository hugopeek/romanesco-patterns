<?php
$assetsPath = $modx->getOption('romanesco.custom_js_path', $scriptProperties, '');

// Load JS in footer
$modx->regClientScript($assetsPath.'js/formblocks.js');

return '';