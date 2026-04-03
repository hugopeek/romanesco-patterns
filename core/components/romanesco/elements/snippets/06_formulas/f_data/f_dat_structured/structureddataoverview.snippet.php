<?php
/**
 * structuredDataOverview
 *
 * This multifunctional snippet will build up a CollectionPage object,
 * containing data from all Overview blocks on the page.
 *
 * This snippet can be called multiple times on a page, including within
 * overview row templates. Always specify the type parameter to ensure the
 * correct structured data is added to the graph.
 *
 * Important: When looping through overview items, the snippet relies on
 * scriptProperties — not the central schema options — to add each item's data.
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
    'type' => $modx->getOption('type', $scriptProperties, 'CollectionPage'),
    'uid' => $modx->getOption('uid', $scriptProperties),
    'idx' => $modx->getOption('idx', $scriptProperties),
    'fieldIdx' => $modx->getOption('fieldIdx', $scriptProperties, 0),
]);
$graph = &$romanesco->structuredData;

// Limit to one collection
if ($data['fieldIdx'] > 0) return;

// Prepare different data types
$collectionItems = $data['collectionItems'] ?? [];
$collectionMentions = $data['collectionMentions'] ?? [];

switch ($data['type']) {
    case 'CollectionPage':
        $graph
            ->getOrCreate(CollectionPage::class)
            ->identifier("{$data['url']}#collection")
            ->isPartOf(Schema::webPage()
                ->identifier($data['url'])
            )
        ;
        break;

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
        $graph
            ->collectionPage()
            ->hasPart($collectionItems)
        ;
        $romanesco->setSchemaOption('collectionItems', $collectionItems);
        break;

    case 'Person':
        $collectionMentions[] = Schema::Person()
            ->name($scriptProperties['name'] ?? '')
            ->jobTitle($scriptProperties['jobTitle'] ?? '')
            ->memberOf(Schema::Organization()
                ->identifier($data['siteURL'] . '#organization')
            )
            ->url($modx->makeUrl($scriptProperties['id'], null, null, 'full'))
        ;
        $graph
            ->collectionPage()
            ->mentions($collectionMentions)
        ;
        $romanesco->setSchemaOption('collectionMentions', $collectionMentions);
        break;

    default:
        $collectionItems[] = Schema::{$data['type']}()
            ->name($scriptProperties['name'] ?? '')
            ->description($scriptProperties['description'] ?? '')
            ->url($modx->makeUrl($scriptProperties['id'], null, null, 'full'))
        ;
        $graph
            ->collectionPage()
            ->hasPart($collectionItems)
        ;
        $romanesco->setSchemaOption('collectionItems', $collectionItems);
        break;
}

return;