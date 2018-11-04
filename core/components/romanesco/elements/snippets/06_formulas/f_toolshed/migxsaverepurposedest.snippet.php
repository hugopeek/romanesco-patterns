<?php
$properties = $modx->getOption('scriptProperties', $scriptProperties, array());

// Set current resource as source
$object->set('source', $properties['resource_id']);
$object->save();

return '';