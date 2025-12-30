<?php
/**
 * cacheWarmup
 *
 * Visit all URLs in sitemap to warm up the cache.
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var string $input
 *
 * @package romanesco
 */

use MODX\Revolution\modX;
use EliasHaeussler\CacheWarmup;

$sitemapURL = $modx->getOption('sitemap_url', $scriptProperties, '');

// Instantiate
$cacheWarmer = new CacheWarmup\CacheWarmer();

// Configure
$cacheWarmer->addSitemaps($sitemapURL);

// Run
$result = $cacheWarmer->run();

// Report
$output = '';
if (!empty($successfulUrls = $result->getSuccessful())) {
    foreach ($successfulUrls as $url) {
        $modx->log(modX::LOG_LEVEL_INFO, '[CacheWarmup] Successfully warmed up ' . $url->getUri());
    }
    $output = "Successfully warmed up all URLs.";
}
if (!empty($failedUrls = $result->getFailed())) {
    foreach ($failedUrls as $url) {
        $modx->log(modX::LOG_LEVEL_ERROR, '[CacheWarmup] Failed to warm up ' . $url->getUri());
    }
    $output = "Failed to warm up all URLs. Please refer to error log for details.";
}

return $output;