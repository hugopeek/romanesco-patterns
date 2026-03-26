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
$url = $modx->makeUrl($modx->resource->id, null, null, 'full');

// Use the object initialized within the Romanesco class, to allow overwriting
$graph = &$romanesco->structuredData;

$faqs = $modx->runSnippet('cbGetFieldContent', [
    'resource' => $modx->resource->get('id'),
    'field' => $modx->getOption('romanesco.cb_field_faq_id', $scriptProperties),
    'returnAsJSON' => true
]);
$faqs = json_decode($faqs, true);

$faqItems = [];
foreach ($faqs[0]['rows'] as $idx => $faq) {
    $faqItems[] = Schema::question()
        ->name($faq['heading']['value'] ?? '')
        ->position($idx + 1)
        ->acceptedAnswer(
            Schema::answer()
                ->text(strip_tags($faq['content']['value'] ?? ''))
            )
        ;
}

$graph
    ->fAQPage()
    ->mainEntity($faqItems)
;

$modx->setPlaceholder('structured_data', json_encode($graph, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT));

return '';