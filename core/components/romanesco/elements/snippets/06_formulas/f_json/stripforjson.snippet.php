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
return str_replace('\n','',json_encode($input));