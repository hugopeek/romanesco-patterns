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

$data = $romanesco->getSchemaOptions();
$graph = &$romanesco->structuredData;

$crumbs = array($modx->runSnippet('pdoCrumbs', [
    'from' => 0,
    'to' => $modx->resource->id,
    'where' => '{"alias_visible:!=":"0"}',
    'return' => 'data'
]));

$crumbItems = [];
foreach ($crumbs[0] as $crumb) {
    $crumbItems[] = Schema::listItem()
        ->position($crumb['idx'])
        ->item([
            '@id' => $data['siteURL'] . $crumb['uri'],
            'name' => $crumb['menutitle'] ?? $crumb['pagetitle']
        ])
    ;
}

$graph
    ->breadcrumbList()
    ->identifier($data['url'] . '#breadcrumb')
    ->itemListElement($crumbItems)
;

return;