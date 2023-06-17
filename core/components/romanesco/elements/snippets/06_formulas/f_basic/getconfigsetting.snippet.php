<?php
/**
 * getConfigSetting
 *
 * Context aware retrieval of a Configuration (ClientConfig) setting.
 *
 * @var modX $modx
 * @var array $scriptProperties
 */

$corePath = $modx->getOption('romanescobackyard.core_path', null, $modx->getOption('core_path') . 'components/romanescobackyard/');
$romanesco = $modx->getService('romanesco','Romanesco',$corePath . 'model/romanescobackyard/', array('core_path' => $corePath));

if (!($romanesco instanceof Romanesco)) return;

$context = $modx->getOption('context', $scriptProperties);
$setting = $modx->getOption('setting', $scriptProperties);

return $romanesco->getConfigSetting($setting, $context);