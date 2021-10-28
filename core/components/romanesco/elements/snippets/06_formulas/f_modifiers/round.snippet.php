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
 * You can also round to the next higher or lower whole number:
 *
 * @example [[+value:round=`up`]]
 * @example [[+value:round=`down`]]
 *
 * Comma separator for decimals will be converted to a dot, so don't use ',' as
 * thousands separator!
 *
 * @var modX $modx
 * @var array $scriptProperties;
 * @var string $input;
 * @var string $options;
 */

if ($input == '') return '';
if (!$options) $options = 0;
$input = str_replace(',', '.', $input); // Darn you Europeans

if ($options == 'up') return ceil($input);
if ($options == 'down') return floor($input);

return round($input,$options);