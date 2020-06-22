<?php
/**
 * stripForJSON
 *
 * Escape backslashes and double quotes.
 */
$input = $modx->getOption('input', $scriptProperties, $input);
if ($input == '') { return ''; }
return str_replace('\n','',json_encode($input));