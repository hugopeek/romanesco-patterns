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

if (!$romanesco->getConfigSetting('structured_data')) return;

$data = $romanesco->getSchemaOptions([
    'fieldIdx' => $modx->getOption('fieldIdx', $scriptProperties)
]);
$graph = &$romanesco->structuredData;

// Get the current count of FAQ items added so far
$currentCount = (int)$data['faqItemsCount'] ?? 0;

$faqs = $modx->runSnippet('cbGetFieldContent', [
    'resource' => $modx->resource->get('id'),
    'field' => $modx->getOption('romanesco.cb_field_faq_id', $scriptProperties),
    'limit' => 1,
    'offset' => $data['fieldIdx'],
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

// Retrieve previous items first if page has multiple FAQ blocks
if ($data['fieldIdx'] > 0) {
    $previousItems = $data['faqItems'] ?? [];
    $allItems = array_merge($previousItems, $faqItems);
    $graph
        ->fAQPage()
        ->mainEntity($allItems)
    ;
} else {
    $graph
        ->fAQPage()
        ->mainEntity($faqItems)
        ->isPartOf(Schema::webPage()
            ->identifier($data['url'])
        )
    ;
}

// Store data for the next snippet call
$romanesco->setSchemaOption('faqItems', $allItems ?? $faqItems);
$romanesco->setSchemaOption('faqItemsCount', $currentCount + count($faqItems));

return;