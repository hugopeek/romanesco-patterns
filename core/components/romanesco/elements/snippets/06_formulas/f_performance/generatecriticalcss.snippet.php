<?php
/**
 * generateCriticalCSS
 *
 * Determine which CSS styles are used above the fold and write them to a custom
 * CSS file. This needs NPM and the critical package to be installed.
 *
 * https://github.com/addyosmani/critical
 *
 * It works by using runProcessor to save the given resource, which triggers
 * the GenerateCriticalCSS plugin, which in turn triggers the critical gulp task.
 * This detour is required, because the gulp task needs to know the exact path
 * of the critical CSS file, which is stored in a TV. Without the save action,
 * that TV might still be empty.
 *
 * Usage:
 *
 * - As a utility snippet. Place it in the content somewhere and visit that page
 *   in the browser to generate the file.
 * - As tpl inside a getResources / pdoTools call, to generate CSS for a batch
 *   of resources. Be careful though: will quickly lead to performance issues!
 * - As snippet source for a Scheduler task. This will bypass the processor
 *   part and execute the task directly.
 *
 * Example:
 *
 * [[!generateCriticalCSS? &id=`[[+id]]`]]
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var object $task
 * @var Romanesco $romanesco
 *
 * @package romanesco
 */

use MODX\Revolution\modX;
use MODX\Revolution\modResource;
use Psr\Container\NotFoundExceptionInterface;
use FractalFarming\Romanesco\Romanesco;

try {
    $romanesco = $modx->services->get('romanesco');
} catch (NotFoundExceptionInterface $e) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[Romanesco3x] ' . $e->getMessage());
    return '';
}

$resourceID = (int) $modx->getOption('id', $scriptProperties, 0);
$resourceURL = $modx->getOption('url', $scriptProperties, '');
$resourceURI = $modx->getOption('uri', $scriptProperties, '');
$context = $modx->getOption('context', $scriptProperties, '');

// Make sure we have a resource to work with
if ($resourceID <= 0) return '';
$resource = $modx->getObject(modResource::class, $resourceID);
if (!($resource instanceof modResource)) return '';

// Fall back on existing resource values if needed
$uri = $resourceURI !== '' ? $resourceURI : $resource->get('uri');
$context = $context !== '' ? $context : $resource->get('context_key');

// If snippet is run as scheduled task, generate CSS directly
if (isset($task) && is_object($task)) {
    $romanesco->generateCriticalCSS([
        'id' => $resourceID,
        'url' => $resourceURL,
        'uri' => $resourceURI ?? $resource->get('uri'),
        'cssPath' => $romanesco->getContextSetting('romanesco.custom_css_path', $resource->get('context_key')),
        'criticalPath' => $romanesco->getContextSetting('romanesco.critical_css_path', $resource->get('context_key')),
        'distPath' => $romanesco->getContextSetting('romanesco.semantic_dist_path', $resource->get('context_key')),
    ]);

    return "Critical CSS generated for: $uri ($resourceID)";
}

// Run update processor to generate the critical_css_uri TV value
// NB: some fields are required for the processor to run!
// NB: sometimes an old alias is retrieved when alias is not forwarded!!
$resourceFields = [
    'id' => $resourceID,
    'pagetitle' => $resource->get('pagetitle'),
    'alias' => $resource->get('alias'),
    'context_key' => $resource->get('context_key'),
    'class_key' => $resource->get('class_key'),
    'published' => $resource->get('published')
];

// The update processor will trigger the GenerateCriticalCSS plugin
$response = $modx->runProcessor('resource/update', $resourceFields);

if (is_object($response) && $response->isError()) {
    $error = 'Failed to update resource: ' . $resource->get('pagetitle') . '. Errors: ' . implode(', ', $response->getAllErrors());
    $modx->log(modX::LOG_LEVEL_ERROR, $error, __METHOD__, __LINE__);
    return $error;
}

return "Critical CSS will be generated for: $uri ($resourceID)";