<?php
/**
 * migxResetNULL
 *
 * After save hook for MIGXdb. Prevents database fields with default value of
 * NULL from being set to 0 after a save action in MIGX.
 *
 * @var modX $modx
 * @var array $scriptProperties
 */

$object = $modx->getOption('object', $scriptProperties, null);
$properties = $modx->getOption('scriptProperties', $scriptProperties, '');
$configs = $modx->getOption('configs', $properties, '');

// Compare values in properties to newly saved object
foreach ($properties as $key => $value) {
    $objectValue = $object->get($key);

    // Reset to NULL if property value is empty and object value is 0
    if ($objectValue === 0 && $value === '') {
        //$modx->log(modX::LOG_LEVEL_ERROR, 'NULL was reset for: ' . $key);
        $object->set($key, NULL);
        $object->save();
    }
}

return true;