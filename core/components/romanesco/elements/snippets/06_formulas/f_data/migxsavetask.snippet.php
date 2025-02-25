<?php
/**
 * migxSaveTask
 *
 * Aftersave hook for MIGXdb. Links the task to the parent object.
 *
 * @var modX $modx
 * @var array $scriptProperties
 */

$object = $modx->getOption('object', $scriptProperties);
$properties = $modx->getOption('scriptProperties', $scriptProperties, array());
$configs = $modx->getOption('configs', $properties, '');

$co_id = $modx->getOption('co_id', $properties, 0);

if (!is_object($object)) return;

// Attach object to parent
$object->set('parent_id', $co_id);

// If co_id is 0, then parent might be a resource
if (!$co_id && $properties['resource_id']) {
    $object->set('parent_id', $properties['resource_id']);
}

$object->save();

return '';