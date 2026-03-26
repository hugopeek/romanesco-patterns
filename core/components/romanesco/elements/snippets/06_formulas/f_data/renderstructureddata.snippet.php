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

// Use the object initialized within the Romanesco class, to allow overwriting
$graph = &$romanesco->structuredData;

$data = [
    // System / context
    'siteName' => $modx->getOption('site_name', $scriptProperties),
    'siteURL' => $modx->getOption('site_url', $scriptProperties),
    'httpHost' => $modx->getOption('http_host', $scriptProperties),
    'context' => $modx->getOption('context_key', $scriptProperties),

    // ClientConfig
    'clientType' => $modx->getOption('client_type', $scriptProperties, $romanesco->getConfigSetting('client_type')),
    'clientPhone' => $modx->getOption('client_phone', $scriptProperties, $romanesco->getConfigSetting('client_phone')),
    'clientEmail' => $modx->getOption('client_email', $scriptProperties, $romanesco->getConfigSetting('client_email')),
    'logoPath' => $modx->getOption('logo_path', $scriptProperties, $romanesco->getConfigSetting('logo_path')),

    // Resource
    'pagetitle' => $modx->resource->get('pagetitle'),
    'longtitle' => $modx->resource->get('longtitle'),
    'description' => $modx->resource->get('description'),
    'introtext' => $modx->resource->get('introtext'),
    'url' => $modx->makeUrl($modx->resource->id, null, null, 'full'),

    // TVs
    'headerVisible' => $modx->resource->getTVValue('header_visibility'),
    'toolbarVisible' => $modx->resource->getTVValue('toolbar_visibility'),
    'authorID' => $modx->resource->getTVValue('author_id'),
];

// Organization
if ($data['clientType'] == 'organization') {
    $graph
        ->organization()
        ->identifier($data['siteURL'] . '#organization')
        ->name($data['siteName'])
        ->url($data['siteURL'])
        ->telephone($data['clientPhone'])
        ->email($data['clientEmail'])
        ->address(Schema::postalAddress()
            ->streetAddress('Tuburan Drive 1')
            ->addressLocality('Tugbok District')
            ->addressRegion('Davao City')
            ->addressCountry('PH')
            ->postalCode('8000')
        )
        ->logo(Schema::imageObject()
            ->identifier($data['siteURL'] . "#logo")
            ->url(str_replace("//", "/", $data['siteURL'] . $data['logoPath']))
            ->caption($data['siteName'])
        )
        ->image([
            '@id' => $data['siteURL'] . "#logo"
        ])
    ;
}

// Person
if ($data['clientType'] == 'person') {
    $graph
        ->person()
        ->name($data['siteName'])
        ->url($data['siteURL'])
        ->telephone($data['clientPhone'])
        ->email($data['clientEmail'])
    ;
}

// Site
$graph
    ->webSite()
    ->identifier($data['siteURL'] . "#website")
    ->name($data['siteName'])
    ->url($data['siteURL'])
    ->publisher(Schema::organization()
        ->identifier($data['siteURL'] . '#organization')
    )
;

// Page
$graph
    ->webPage()
    ->identifier($data['url'])
    ->name($data['longtitle'] ?: $data['pagetitle'])
    ->description($data['description'] ?: strip_tags($data['introtext']))
    ->url($data['url'])
    ->inLanguage($romanesco->getContextSetting('cultureKey', 'web'))
    ->isPartOf([
        '@id' => $data['siteURL'] . '#website',
    ])
;

// Breadcrumbs
if ($data['toolbarVisible']) {
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
}

// Load custom attributes
$modx->runSnippet('renderStructuredDataTheme', $data);

// Write everything to placeholders
$modx->setPlaceholder('structured_data', json_encode($graph, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT));

return '';