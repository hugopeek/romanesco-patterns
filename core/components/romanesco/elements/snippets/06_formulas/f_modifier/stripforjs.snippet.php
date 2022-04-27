<?php
/**
 * stripForJS
 *
 * Prepare the input for use in Javascript. This means escaping certain
 * characters to make sure the surrounding HTML doesn't break.
 *
 * @var modX $modx
 * @var array $scriptProperties;
 * @var string $input;
 * @var string $options;
 */

$output = $input;
$output = str_replace('/', '\/', $output);
$output = str_replace("'", "\'", $output);
$output = str_replace("\n", '', $output);
$output = preg_replace("/(>+(\s)*<+)/", '><', $output);
$output = preg_replace("/\s+/", ' ', $output);
return $output;