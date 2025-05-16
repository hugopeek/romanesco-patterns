<?php
/**
 * migxSaveOptionGroup
 *
 * Aftersave hook for MIGXdb. Updates existing keys in child options if you
 * change this setting in Group. Also increments the sort order.
 *
 * @var modX $modx
 * @var array $scriptProperties
 */

$object = $modx->getOption('object', $scriptProperties, null);
$properties = $modx->getOption('scriptProperties', $scriptProperties, array());
$configs = $modx->getOption('configs', $properties, '');

// Update key in child options if you change it
if (is_object($object) && isset($properties['key'])) {
    $children = $modx->getCollection('FractalFarming\Romanesco\rmOption', array('group' => $object->get('id')));

    foreach ($children as $child) {
        $child = $modx->getObject('FractalFarming\Romanesco\rmOption', array('id' => $child->get('id')));

        $child->set('key', $properties['key']);
        $child->save();
    }
}

// Increment sort order of new items
//if ($properties['object_id'] === 'new') {
//
//    // Ask for last position
//    $q = $modx->newQuery('FractalFarming\Romanesco\rmOptionGroup');
//    $q->select(array(
//        "max(position)",
//    ));
//    $lastPosition = $modx->getValue($q->prepare());
//
//    // Set and Save
//    $object->set('position', ++$lastPosition);
//    $object->save();
//}

return '';