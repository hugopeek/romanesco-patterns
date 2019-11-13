<?php
/**
 * jsonToCSS
 *
 * Turn a JSON object into CSS formatting.
 *
 * This is initially intended to turn CB repeater elements into CSS, without
 * having to change the internal templating in ContentBlocks.
 */

$corePath = $modx->getOption('romanescobackyard.core_path', null, $modx->getOption('core_path') . 'components/romanescobackyard/');
$romanesco = $modx->getService('romanesco','Romanesco',$corePath . 'model/romanescobackyard/',array('core_path' => $corePath));

if (!($romanesco instanceof Romanesco)) return;

$json = $modx->getOption('json', $scriptProperties, '');
$key = $modx->getOption('key', $scriptProperties, '');
$tpl = $modx->getOption('tpl', $scriptProperties, '');

$jsonArray = json_decode($json, true);

// Search array for given key
$result = $romanesco->recursiveArraySearch($jsonArray,$key);

// Flatten first level, since it's always 1 JSON object
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
    return implode($output);
}

return;