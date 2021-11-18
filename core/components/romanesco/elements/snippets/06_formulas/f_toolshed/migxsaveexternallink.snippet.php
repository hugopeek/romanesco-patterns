<?php
$object = &$modx->getOption('object', $scriptProperties, null);
$properties = $modx->getOption('scriptProperties', $scriptProperties, array());
$configs = $modx->getOption('configs', $properties, '');

// Set lowest new number available
if ($properties['object_id'] === 'new') {

    // Ask for highest number so far
    $q = $modx->newQuery('rmExternalLink', array('resource_id' => $properties['resource_id']));
    $q->select(array(
        "max(number)",
    ));
    $lastNumber = $modx->getValue($q->prepare());

    // Set and Save
    $object->set('number', ++$lastNumber);
    $object->save();
}

return '';