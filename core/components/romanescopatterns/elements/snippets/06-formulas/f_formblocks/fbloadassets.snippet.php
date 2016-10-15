<?php
//$assetsPath = 'assets/components/patternlab/'; // @todo: turn this into the Romanesco SUI themes' dist folder path
$assetsPath = $this->modx->getOption('romanesco-patterns.custom-js-path');

// Load JS in footer
$modx->regClientScript($assetsPath.'js/formblocks.js');

return '';