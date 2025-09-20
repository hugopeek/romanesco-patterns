<?php
/**
 * getConfigSetting
 *
 * Context aware retrieval of a Configuration (ClientConfig) setting.
 *
 * @var modX $modx
 * @var array $scriptProperties
 */

use FractalFarming\Romanesco\Romanesco;

/** @var Romanesco $romanesco */
try {
    $romanesco = $modx->services->get('romanesco');
} catch (\Psr\Container\NotFoundExceptionInterface $e) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[Romanesco3x] ' . $e->getMessage());
}

$context = $modx->getOption('context', $scriptProperties);
$setting = $modx->getOption('setting', $scriptProperties);

return $romanesco->getConfigSetting($setting, $context);