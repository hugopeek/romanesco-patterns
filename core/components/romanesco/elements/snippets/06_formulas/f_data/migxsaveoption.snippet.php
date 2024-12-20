<?php
/**
 * migxSaveOption
 *
 * Aftersave hook for MIGXdb. Gets and sets the group (parent) ID inside a
 * nested configuration. Also generates an alias if none is present and
 * increments the sort order.
 *
 * @var modX $modx
 * @var array $scriptProperties
 */

$object = $modx->getOption('object', $scriptProperties);
$properties = $modx->getOption('scriptProperties', $scriptProperties, array());
$configs = $modx->getOption('configs', $properties, '');

$co_id = $modx->getOption('co_id', $properties, 0);
$parent = $modx->getObject('rmOptionGroup', array('id' => $co_id));

// Set key and ID of parent object
if (is_object($object)) {
    $object->set('key', $parent->get('key'));
    $object->set('group', $co_id);
}

// Generate alias if empty
if (!$object->get('alias')) {
    $object->set('alias', $object->get('name'));
}

// Make sure alias is formatted as such
$alias = $modx->filterPathSegment($object->get('alias'), [
    'friendly_alias_restrict_chars' => 'alphanumeric'
]);
$object->set('alias', $alias);

// Increment sort order of new items
if ($properties['object_id'] === 'new') {
    // Ask for last position
    $q = $modx->newQuery('rmOption');
    $q->select(array(
        "max(position)",
    ));
    $lastPosition = $modx->getValue($q->prepare());
    $object->set('position', ++$lastPosition);
}

$object->save();

return '';