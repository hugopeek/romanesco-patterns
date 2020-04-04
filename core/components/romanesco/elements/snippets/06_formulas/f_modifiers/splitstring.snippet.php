<?php
/**
 * splitString
 *
 * Divide string into multiple sections, based on a delimiter.
 *
 * If used as a regular snippet, each part is output to a separate placeholder.
 *
 * If used as output modifier, you need to specify the number of the part you
 * want to get. For example, if your string is:
 *
 * 'Ubuntu|300,700,300italic,700italic|latin'
 *
 * Then [[+placeholder:splitString=`1`]] will return 'Ubuntu'.
 */

$input = $modx->getOption('input', $scriptProperties, $input);
$options = $modx->getOption('options', $scriptProperties, $options);
$delimiter = $modx->getOption('delimiter', $scriptProperties, '|');
$prefix = $modx->getOption('prefix', $scriptProperties, 'snippet');

// Output filters are also processed when the input is empty, so check for that
if ($input == '') { return ''; }

// Break up the string
$output = explode($delimiter,$input);
$idx = 0;

// If snippet is used as output modifier, return matching section
if ($options) {
    return $output[$options - 1];
}

// Process each section individually
foreach ($output as $value) {
    $idx++;
    $modx->toPlaceholder($idx, trim($value), $prefix);

    // Additional first and last placeholders
    if ($idx == 1) {
        $modx->toPlaceholder('first', trim($value), $prefix);
    }
    $modx->toPlaceholder('last', trim($value), $prefix);
}

// Return placeholder with total idx
$modx->toPlaceholder('total', $idx, $prefix);

return '';