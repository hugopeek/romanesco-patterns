<?php
/**
 * renderStructuredData
 *
 * Turn given schema.org properties into a proper JSON-LD array.
 *
 * All types are collected in a central $graph object, which is initiated in the
 * Romanesco class.
 *
 * You can add / overwrite data types from any snippet that references the graph
 * or by creating a structuredDataTheme snippet. This snippet will be run after
 * everything else, so default types can be overwritten.
 *
 * NB: Put this snippet at the bottom of the page, because the graph cannot be
 * modified anymore once the placeholder is set!
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

// Kill switch
if (!$romanesco->getConfigSetting('structured_data')) return;

// Load global graph
$data = $romanesco->getSchemaOptions();
$graph = &$romanesco->structuredData;

// Load custom properties
$modx->runSnippet('structuredDataTheme', ['data' => $data]);

// Write everything to page head
$output = json_encode($graph, JSON_UNESCAPED_SLASHES);
$modx->regClientStartupHTMLBlock($modx->getChunk('structuredDataSite', ['structured_data' => $output]));

return;