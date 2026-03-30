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

// Get the current count of cta items added so far
$currentCount = (int)$modx->getPlaceholder('cta_items_count') ?? 0;

$ctas = $modx->runSnippet('cbGetFieldContent', [
    'resource' => $modx->resource->get('id'),
    'field' => $modx->getOption('romanesco.cb_field_cta_id', $scriptProperties),
    'limit' => 1,
    'offset' => $data['fieldIdx'],
    'returnAsJSON' => true
]);
$ctas = json_decode($ctas, true);

$ctaItems = [];
foreach ($ctas[0]['rows'] as $idx => $cta) {
    $ctaItems[] = Schema::communicateAction()
        ->position($currentCount + $idx + 1);
}

// Update the running count for the next snippet call
$modx->setPlaceholder('cta_items_count', $currentCount + count($ctaItems));

// Retrieve previous items first if page has multiple cta blocks
if ($data['fieldIdx'] > 0) {
    $previousItems = $modx->getPlaceholder('cta_all_items') ?? [];
    $allItems = array_merge($previousItems, $ctaItems);
    $graph->webPage()->potentialAction($allItems);
} else {
    $graph->webPage()->potentialAction($ctaItems);
}

// Store all items for the next snippet call
$modx->setPlaceholder('cta_all_items', $allItems ?? $ctaItems);

return '';