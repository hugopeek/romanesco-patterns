<?php
/**
 * round
 *
 * The wheels on the bus... Round a decimal value to a whole number or with a
 * specified amount of decimals.
 *
 * @example [[+value:round=`2`]] returns the value with 2 decimals
 * @example [[+value:round]] returns a whole number
 *
 * @var modX $modx
 * @var array $scriptProperties;
 * @var string $input;
 * @var string $options;
 */

if ($input == '') return '';
if (!$options) $options = 0;
return round($input,$options);