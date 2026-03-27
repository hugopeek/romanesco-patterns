<?php
/**
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

$siteName = $modx->getOption('site_name', $scriptProperties);
$siteURL = $modx->getOption('site_url', $scriptProperties);
$fieldIdx = $modx->getOption('fieldIdx', $scriptProperties);
$url = $modx->makeUrl($modx->resource->id, null, null, 'full');

// Use the object initialized within the Romanesco class, to allow overwriting
$graph = &$romanesco->structuredData;

// Get the current count of FAQ items added so far
$currentCount = (int)$modx->getPlaceholder('faq_items_count') ?? 0;

$faqs = $modx->runSnippet('cbGetFieldContent', [
    'resource' => $modx->resource->get('id'),
    'field' => $modx->getOption('romanesco.cb_field_faq_id', $scriptProperties),
    'limit' => 1,
    'offset' => $fieldIdx,
    'returnAsJSON' => true
]);
$faqs = json_decode($faqs, true);

$faqItems = [];
foreach ($faqs[0]['rows'] as $idx => $faq) {
    $faqItems[] = Schema::question()
        ->name($faq['heading']['value'] ?? '')
        ->position($currentCount + $idx + 1)
        ->acceptedAnswer(
            Schema::answer()
                ->text(strip_tags($faq['content']['value'] ?? ''))
            )
        ;
}

// Update the running count for the next snippet call
$modx->setPlaceholder('faq_items_count', $currentCount + count($faqItems));

// Retrieve previous items first if page has multiple FAQ blocks
if ($fieldIdx > 0) {
    $previousItems = $modx->getPlaceholder('faq_all_items') ?? [];
    $allItems = array_merge($previousItems, $faqItems);
    $graph->fAQPage()->mainEntity($allItems);
} else {
    $graph->fAQPage()->mainEntity($faqItems);
}

// Store all items for the next snippet call
$modx->setPlaceholder('faq_all_items', $allItems ?? $faqItems);

return '';