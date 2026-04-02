<?php
/**
 * structuredDataOverview
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var Romanesco $romanesco
 * @package romanesco
 */

use MODX\Revolution\modX;
use FractalFarming\Romanesco\Romanesco;
use Spatie\SchemaOrg\Schema;
use Spatie\SchemaOrg\CollectionPage;

$romanesco = $modx->romanesco;

if (!$romanesco->getConfigSetting('structured_data')) return;

$data = $romanesco->getSchemaOptions([
    'type' => $modx->getOption('type', $scriptProperties, 'collection'),
    'uid' => $modx->getOption('uid', $scriptProperties),
    'idx' => $modx->getOption('idx', $scriptProperties),
    'fieldIdx' => $modx->getOption('fieldIdx', $scriptProperties, 0),
]);
$graph = &$romanesco->structuredData;

// Limit to one collection
if ($data['fieldIdx'] > 0) return;

if ($data['type'] == 'collection') {
    $graph
        ->getOrCreate(CollectionPage::class)
        ->identifier("{$data['url']}#{$data['type']}")
        ->isPartOf(Schema::webPage()
            ->identifier($data['url'])
        )
    ;
} else {
    $collectionItems = $data['collectionItems'] ?? [];

    // Add current item
    $collectionItems[] = Schema::{$data['type']}()
        ->identifier("{$data['url']}#{$data['uid']}_{$data['idx']}")
        ->name($scriptProperties['name'] ?? '')
        ->description($scriptProperties['description'] ?? '')
        ->url($modx->makeUrl($scriptProperties['id'], null, null, 'full'))
    ;

    // Update graph
    $graph
        ->collectionPage()
        ->hasPart($collectionItems)
    ;

    // Store items for next row
    $romanesco->setSchemaOption('collectionItems', $collectionItems);
}

return;