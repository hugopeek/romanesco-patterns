<?php
/**
 * migxSaveRelated
 *
 * Aftersave hook for MIGXdb. Sets source and target IDs in opposite direction
 * also, to establish a double cross-link. Yeah, watch your back with those!
 *
 * @var modX $modx
 * @var array $scriptProperties
 */

$object = $modx->getOption('object', $scriptProperties);
$properties = $modx->getOption('scriptProperties', $scriptProperties, array());
$configs = $modx->getOption('configs', $properties, '');

$objectID = $object->get('id');
$crosslinkID = $object->get('crosslink_id');
$source = $object->get('source');
$destination = $object->get('destination');
$title = $object->get('title');
$description = $object->get('description');
$createdon = $object->get('createdon');
$createdby = $object->get('createdby');
$weight = $object->get('weight');

// Set current resource as source (if no source was set)
if (!$source && isset($properties['resource_id'])) {
    $object->set('source', $properties['resource_id']);
    $object->save();

    // Update source variable
    $source = $object->get('source');
}

// Check if cross-link exists already
$existingSrc = $modx->getObject('rmCrossLink', array('source' => $source, 'destination' => $destination));
$existingDest = $modx->getObject('rmCrossLink', array('source' => $destination, 'destination' => $source));

// Create another cross-link in the opposite direction
if (is_object($existingSrc) && !is_object($existingDest)) {
    $newSrc = $modx->newObject('rmCrossLink', array(
        'crosslink_id' => $objectID,
        'source' => $destination,
        'destination' => $source,
        'title' => $title,
        'description' => $description,
        'createdon' => $createdon,
        'createdby' => $createdby,
        'weight' => $weight,
    ));
    $newSrc->save();

    // Set crosslink ID of source
    $object->set('crosslink_id', $newSrc->get('id'));
    $object->save();
}

return '';