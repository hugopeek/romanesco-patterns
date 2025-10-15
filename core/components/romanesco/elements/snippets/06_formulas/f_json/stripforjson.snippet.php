<?php
/**
 * stripForJSON
 *
 * Escape backslashes and double quotes.
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var string $input
 */

$input = $modx->getOption('input', $scriptProperties, $input);
if ($input == '') { return ''; }
$output = str_replace(['\n', '\r'], '', $input);
return json_encode($output);