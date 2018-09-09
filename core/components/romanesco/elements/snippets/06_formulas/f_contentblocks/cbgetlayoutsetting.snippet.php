<?php
/**
 *
 */
 
$layoutID = $modx->getOption('layout', $scriptProperties, '');
$layoutSetting = $modx->getOption('setting', $scriptProperties, '');
$placeholder = $modx->getOption('toPlaceholder', $scriptProperties, '');

// Get CB content from properties column
$data = $modx->resource->getProperty('linear', 'contentblocks');

// Function to search for required fields in JSON array
if (!function_exists('search')) {
    function search($array, $key, $value) {
        $result = array();

        if (is_array($array)) {
            if (isset($array[$key]) && $array[$key] == $value) {
                $result[] = $array;
            }
            foreach ($array as $subarray) {
                $result = array_merge($result, search($subarray, $key, $value));
            }
        }

        return $result;
    }
}

// Function to look for a key in a multi level array
if (!function_exists('recursive_array_search')) {
    function recursive_array_search(array $array, $needle) {
        $result = array();
        $iterator  = new RecursiveArrayIterator($array);
        $recursive = new RecursiveIteratorIterator(
            $iterator,
            RecursiveIteratorIterator::SELF_FIRST
        );
        foreach ($recursive as $key => $value) {
            if ($key === $needle) {
                $result[] = $value;
            }
        }
        return $result;
    }
}

// Get the correct layout
$layout = search($data, 'layout', $layoutID);

// Get the requested layout setting
$setting = recursive_array_search($layout,$layoutSetting);

// Spit it out
$output = implode('', $setting);

// Output to placeholder if one is set
if ($placeholder) {
    $modx->toPlaceholder($placeholder, $output);
    return;
} else {
    return $output;
}