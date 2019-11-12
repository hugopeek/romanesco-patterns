<?php
/**
 * isNumeric
 *
 * Returns given output if string is numeric.
 */

$input = $modx->getOption('input', $scriptProperties, $input);
$output = $modx->getOption('output', $scriptProperties, $options);

// Output filters are also processed when the input is empty, so check for that
if ($input == '') { return ''; }

// Decide whether to clip the start or end of the string
if (is_numeric($input)) {
    return $output;
} else {
    return $input;
}