<?php
/**
 * removeDuplicateLines
 *
 * Scan input for duplicate lines and remove them from the output.
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var string $input
 * @var string $options
 */

$lines = $modx->getOption('input', $scriptProperties, $input);
$file = $modx->getOption('file', $scriptProperties, '');

// Check first if we're dealing with an external file
if ($file) {
    $lines = file_get_contents($file);
}

// Create an array of all lines inside the input
$lines = explode("\n", $lines);
$i = 0;

// Check if the lines array contains duplicates
$output = array_unique($lines);
$output = array_filter($output);

if (is_array($output)) {
    return implode("\n", $output);
} else {
    return $output;
}