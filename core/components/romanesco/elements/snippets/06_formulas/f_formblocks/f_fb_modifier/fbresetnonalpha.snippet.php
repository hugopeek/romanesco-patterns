<?php
/**
 * fbResetNonAlpha
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var string $input
 * @var string $options
 */

$input = preg_replace('/\[and]/', '&', $input);
$input = preg_replace('/\[qmark]/', '?', $input);
$input = preg_replace('/\[semicolon]/', ';', $input);
$input = preg_replace('/\[equals]/', '=', $input);

return $input;