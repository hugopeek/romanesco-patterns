<?php
/**
 * renderStructuredData
 *
 * Turn given schema.org properties into a proper JSON-LD array.
 *
 * All types are collected in a central @graph object. Properties can be redefined along the way, so it's possible to
 * override earlier settings.
 *
 * @depends https://github.com/spatie/schema-org
 *
 * @var modX $modx
 * @var array $scriptProperties
 */

use Spatie\SchemaOrg\Schema;
use Spatie\SchemaOrg\Graph;
use Spatie\SchemaOrg\LocalBusiness;

$corePath = $modx->getOption('romanescobackyard.core_path', null, $modx->getOption('core_path').'components/romanescobackyard/');
$romanesco = $modx->getService('romanesco','Romanesco', $corePath.'model/romanescobackyard/', array('core_path' => $corePath));

if (!($romanesco instanceof Romanesco)) return;
if (!($modx->resource instanceof modResource)) return;

// System / context
$siteName = $modx->getOption('site_name', $scriptProperties);
$siteURL = $modx->getOption('site_url', $scriptProperties);
$httpHost = $modx->getOption('http_host', $scriptProperties);
$context = $modx->getOption('context_key', $scriptProperties);
$clientType = $modx->getOption('client_type', $scriptProperties);
$clientPhone = $modx->getOption('client_phone', $scriptProperties);
$clientEmail = $modx->getOption('client_email', $scriptProperties);

// Resource
$pagetitle = $modx->resource->get('pagetitle');
$longtitle = $modx->resource->get('longtitle');
$description = $modx->resource->get('description');
$introtext = $modx->resource->get('introtext');
$url = $modx->makeUrl($modx->resource->id, null, null, 'full');

$graph = new Graph();

// Organization
$graph
    ->organization()
    ->name($siteName)
    ->url($siteURL)
    ->contactPoint(Schema::contactPoint()
        ->telephone($clientPhone)
        ->email($clientEmail)
    )
;

// Page
$graph
    ->webPage()
    ->name($longtitle ?: $pagetitle)
    ->description($description ?: strip_tags($introtext))
    ->url($url)
;

// Breadcrumbs
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
            '@id' => $siteURL . $crumb['uri'],
            'name' => $crumb['menutitle'] ?? $crumb['pagetitle']
        ])
    ;
}

//$modx->log(modX::LOG_LEVEL_ERROR, print_r($crumbs[0], 1));
//$modx->log(modX::LOG_LEVEL_ERROR, print_r($crumbItems, 1));

$graph
    ->breadcrumbList()
    ->identifier('#breadcrumb')
    ->itemListElement($crumbItems)
;

return json_encode($graph, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);