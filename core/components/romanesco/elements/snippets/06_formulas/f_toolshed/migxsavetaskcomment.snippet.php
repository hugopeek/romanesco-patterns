<?php
/**
 * migxSaveTaskComment
 *
 * Aftersave hook for MIGXdb. Links the comment to the parent task.
 *
 * @var modX $modx
 * @var array $scriptProperties
 */

$object = $modx->getOption('object', $scriptProperties);
$properties = $modx->getOption('scriptProperties', $scriptProperties, array());
$configs = $modx->getOption('configs', $properties, '');

$co_id = $modx->getOption('co_id', $properties, 0);

// Set key and ID of parent object
if (is_object($object)) {
    $object->set('task_id', $co_id);
    $object->save();
}

return '';