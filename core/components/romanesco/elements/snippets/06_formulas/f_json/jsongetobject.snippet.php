<?php
/**
 * jsonGetObject
 *
 * Search a JSON object for specific item and return the entire array.
 *
 * This is initially intended to turn CB repeater elements into CSS, without
 * having to change the internal templating in ContentBlocks.
 */

$corePath = $modx->getOption('romanescobackyard.core_path', null, $modx->getOption('core_path') . 'components/romanescobackyard/');
$romanesco = $modx->getService('romanesco','Romanesco',$corePath . 'model/romanescobackyard/',array('core_path' => $corePath));

if (!($romanesco instanceof Romanesco)) return;

$json = $modx->getOption('json', $scriptProperties, '');
$object = $modx->getOption('object', $scriptProperties, '');
$tpl = $modx->getOption('tpl', $scriptProperties, '');
$outputSeparator = $modx->getOption('outputSeparator', $scriptProperties, '');

$jsonArray = json_decode($json, true);

// Search array for given object
$result = $romanesco->recursiveArraySearch($jsonArray,$object);

// Flatten first level, since that's always the full JSON object itself
$result = $result[0];

// Return result directly if it's no longer an array
if (!is_array($result)) {
    return $result;
}

// Flat arrays can be forwarded directly to the tpl chunk
if (!$result[0]) {
    return $modx->getChunk($tpl, $result);
}

// Loop over multidimensional arrays
if ($result[0]) {
    $output = array();
    foreach ($result as $row) {
        $output[] = $modx->getChunk($tpl, $row);
    }
    return implode($outputSeparator,$output);
}

return;