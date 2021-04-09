<?php
/**
 * stepsLoadAssets
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

$assetsPathDist = $modx->getOption('romanesco.semantic_dist_path', $scriptProperties, '');
$cacheBusterCSS = $romanesco->getCacheBustingString('CSS');

// Header
$modx->regClientCSS($assetsPathDist . '/components/step.min' . $cacheBusterCSS . '.css');

return '';