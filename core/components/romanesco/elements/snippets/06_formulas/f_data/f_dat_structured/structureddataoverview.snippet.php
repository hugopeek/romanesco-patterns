<?php
/**
 * renderCtaData
 *
 * WIP.
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @package romanesco
 */

use MODX\Revolution\modX;
use FractalFarming\Romanesco\Romanesco;
use Spatie\SchemaOrg\Schema;

/** @var Romanesco $romanesco */
try {
    $romanesco = $modx->services->get('romanesco');
} catch (\Psr\Container\NotFoundExceptionInterface $e) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[Romanesco3x] ' . $e->getMessage());
}

if (!$romanesco->getConfigSetting('structured_data')) return;

$data = $romanesco->getSchemaOptions([
    'fieldIdx' => $modx->getOption('fieldIdx', $scriptProperties)
]);
$graph = &$romanesco->structuredData;

// Replace webpage with CollectionPage



return '';