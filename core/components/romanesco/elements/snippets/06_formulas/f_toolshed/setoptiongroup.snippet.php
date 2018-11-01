<?php
$object = &$modx->getOption('object', $scriptProperties, null);
$properties = $modx->getOption('scriptProperties', $scriptProperties, array());

// Get ID of parent object
$co_id = $modx->getOption('co_id', $properties, 0);

if (is_object($object)) {
    $object->set('group', $co_id);
    $object->save();
}

return '';