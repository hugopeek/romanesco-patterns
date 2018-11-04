<?php
$properties = $modx->getOption('scriptProperties', $scriptProperties, array());

// Set current resource as destination
$object->set('destination', $properties['resource_id']);
$object->save();

return '';