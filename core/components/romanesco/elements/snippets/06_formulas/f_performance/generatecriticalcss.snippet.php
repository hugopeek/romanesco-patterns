<?php
/**
 * generateCriticalCSS
 *
 * Determine which CSS styles are used above the fold and write them to a custom
 * CSS file. This needs NPM and the critical package to be installed.
 *
 * https://github.com/addyosmani/critical
 *
 * Usage: this is a utility snippet. Place it in the content somewhere and visit
 * that page in the browser to generate the file.
 *
 * @var modX $modx
 * @var $scriptProperties array
 *
 * @package romanesco
 */

$corePath = $modx->getOption('romanescobackyard.core_path', null, $modx->getOption('core_path') . 'components/romanescobackyard/');
$romanesco = $modx->getService('romanesco','Romanesco',$corePath . 'model/romanescobackyard/',array('core_path' => $corePath));

if (!($romanesco instanceof Romanesco)) return;

$resourceID = $modx->getOption('id', $scriptProperties, '');
$parallel = $modx->getOption('parallel', $scriptProperties, 0);
$resource = $modx->getObject('modResource',$resourceID);

if (!($resource instanceof modResource)) return;

// Run update processor to generate the critical_css_uri TV value
// NB: processor won't run without pagetitle and context_key!
$resourceFields = array(
    'id' => $resourceID,
    'pagetitle' => $resource->get('pagetitle'),
    'context_key' => $resource->get('context_key')
);

$response = $modx->runProcessor('resource/update', $resourceFields);

if ($response->isError()) {
    $error = 'Failed to update resource: ' . $resource->get('pagetitle') . '. Errors: ' . implode(', ', $response->getAllErrors());
    $modx->log(MODX::LOG_LEVEL_ERROR, $error, __METHOD__, __LINE__);
    return $error;
}

$romanesco->generateCriticalCSS(array(
    'id' => $resourceID,
    'uri' => $resource->get('uri'),
    'cssPath' => $romanesco->getContextSetting('romanesco.custom_css_path', $resource->get('context_key')),
    'distPath' => $romanesco->getContextSetting('romanesco.semantic_dist_path', $resource->get('context_key')),
    'parallel' => $parallel,
));

return "Critical CSS generated for <strong>{$resource->get('uri')}</strong> ($resourceID)";
