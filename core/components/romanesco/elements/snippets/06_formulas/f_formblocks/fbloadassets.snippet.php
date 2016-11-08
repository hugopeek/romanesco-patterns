<?php
$assetsPath = $modx->getOption('romanesco.custom_js_path');

// Load JS in footer
$modx->regClientScript($assetsPath.'js/formblocks.js');

return '';