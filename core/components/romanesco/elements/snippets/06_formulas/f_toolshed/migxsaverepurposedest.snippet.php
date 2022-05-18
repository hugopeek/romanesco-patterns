<?php
/**
 * migxSaveRepurposeDest
 *
 * Aftersave hook for MIGXdb. Sets current resource ID as re-purpose source.
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var object $object
 */

$properties = $modx->getOption('scriptProperties', $scriptProperties, array());

// Set current resource as source
$object->set('source', $properties['resource_id']);
$object->save();

return '';