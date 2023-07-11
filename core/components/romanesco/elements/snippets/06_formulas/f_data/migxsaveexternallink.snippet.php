<?php
/**
 * migxSaveExternalLink
 *
 * Aftersave hook for MIGXdb. Increments the link number per resource, so you
 * don't have to fiddle with that manually (as long as you enter the links in
 * the correct order).
 *
 * @var modX $modx
 * @var array $scriptProperties
 */

$object = $modx->getOption('object', $scriptProperties);
$properties = $modx->getOption('scriptProperties', $scriptProperties, array());
$configs = $modx->getOption('configs', $properties, '');

// Set lowest new number available
if ($properties['object_id'] === 'new' && isset($properties['resource_id'])) {

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