<?php
/**
 * migxSaveRepurposeSrc
 *
 * Aftersave hook for MIGXdb. Sets current resource ID as re-purpose destination.
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var object $object
 */

$properties = $modx->getOption('scriptProperties', $scriptProperties, array());

// Set current resource as destination
$object->set('destination', $properties['resource_id']);
$object->save();

return '';