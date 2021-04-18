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
 *
 * @package romanesco
 */

$corePath = $modx->getOption('romanescobackyard.core_path', null, $modx->getOption('core_path') . 'components/romanescobackyard/');
$romanesco = $modx->getService('romanesco','Romanesco',$corePath . 'model/romanescobackyard/',array('core_path' => $corePath));

if (!($romanesco instanceof Romanesco)) return;

$resourceID = $modx->getOption('id', $scriptProperties, '');
$resource = $modx->getObject('modResource', $resourceID);
$parallel = $modx->getOption('parallel', $scriptProperties, 0);

if (!($resource instanceof modResource)) return;

// If snippet is run as scheduled task, generate CSS directly
if (is_object($task)) {
    $romanesco->generateCriticalCSS(array(
        'id' => $resourceID,
        'uri' => $resource->get('uri'),
        'cssPath' => $romanesco->getContextSetting('romanesco.custom_css_path', $resource->get('context_key')),
        'distPath' => $romanesco->getContextSetting('romanesco.semantic_dist_path', $resource->get('context_key')),
        'parallel' => $parallel,
    ));

    return "Critical CSS generated for <strong>{$resource->get('uri')}</strong> ($resourceID)";
}

// Run update processor to generate the critical_css_uri TV value
// NB: processor won't run without pagetitle and context_key!
// NB: sometimes an old alias is retrieved when alias is not forwarded!!
$resourceFields = array(
    'id' => $resourceID,
    'pagetitle' => $resource->get('pagetitle'),
    'alias' => $resource->get('alias'),
    'context_key' => $resource->get('context_key')
);

// The update processor will trigger the GenerateCriticalCSS plugin
$response = $modx->runProcessor('resource/update', $resourceFields);

if ($response->isError()) {
    $error = 'Failed to update resource: ' . $resource->get('pagetitle') . '. Errors: ' . implode(', ', $response->getAllErrors());
    $modx->log(modX::LOG_LEVEL_ERROR, $error, __METHOD__, __LINE__);
    return $error;
}

return "Critical CSS generated for <strong>{$resource->get('uri')}</strong> ($resourceID)";