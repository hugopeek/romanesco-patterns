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

// Prepare different data types
$collectionItems = $data['collectionItems'] ?? [];
switch ($data['type']) {
    case 'Article':
        $collectionItems[] = Schema::Article()
            ->headline($scriptProperties['headline'] ?? '')
            ->abstract($scriptProperties['abstract'] ?? '')
            ->author(Schema::person()
                ->name($scriptProperties['authorName'] ?? '')
                ->url($modx->makeUrl($scriptProperties['authorId'], null, null, 'full'))
            )
            ->datePublished($scriptProperties['datePublished'] ?? '')
            ->dateModified($scriptProperties['dateModified'] ?? '')
            ->url($modx->makeUrl($scriptProperties['id'], null, null, 'full'))
        ;
        break;

    default:
        $collectionItems[] = Schema::{$data['type']}()
            ->name($scriptProperties['name'] ?? '')
            ->description($scriptProperties['description'] ?? '')
            ->url($modx->makeUrl($scriptProperties['id'], null, null, 'full'))
        ;
        break;
}

// Create or update graph
if ($data['type'] == 'CollectionPage') {
    $graph
        ->getOrCreate(CollectionPage::class)
        ->identifier("{$data['url']}#collection")
        ->isPartOf(Schema::webPage()
            ->identifier($data['url'])
        )
    ;
} else {
    $graph
        ->collectionPage()
        ->hasPart($collectionItems)
    ;

    // Store items for next row
    $romanesco->setSchemaOption('collectionItems', $collectionItems);
}

return;