<?php
/**
 * textToNumber
 *
 * Turn a written number into an actual one.
 *
 * Written numbers are used for setting column counts in SemanticUI, but as
 * numeric values they can be reused in other places too.
 * For example: to set the number of visible slides in the JS configuration.
 *
 * Easter egg: reverses to numberToText functionality when input is numeric
 *
 * NB: there seems to be an issue when using this snippet inside a CB template
 * as output modifier. It messes up the cache and prevents the alternative from
 * working properly. To fix: remove all modifiers, replace with full snippet
 * call and clear cache (from top menu, NOT by saving resource).
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var string $input
 * @var string $options
 */

$input = $modx->getOption('input', $scriptProperties, $input);
$output = '';

$numbers = array(
    '1' => 'one',
    '2' => 'two',
    '3' => 'three',
    '4' => 'four',
    '5' => 'five',
    '6' => 'six',
    '7' => 'seven',
    '8' => 'eight',
    '9' => 'nine',
    '10' => 'ten',
    '11' => 'eleven',
    '12' => 'twelve',
    '13' => 'thirteen',
    '14' => 'fourteen',
    '15' => 'fifteen',
    '16' => 'sixteen'
);

if (is_numeric($input)) {
    $output = $numbers[$input];
} else {
    $output = array_search($input, $numbers);
}

return $output;