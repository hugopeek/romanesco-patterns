<?php
/**
 * beforeEach snippet
 *
 * Grab a comma-separated list and prefix all items with given value.
 * Optionally, the separator can be changed and output can be forwarded to a
 * placeholder.
 *
 * Usage examples:
 *
 * [[++navbar_exclude_resources:beforeEach=`-`]]
 *
 * [[beforeEach?
 *     &input=`[[++navbar_exclude_resources]]`
 *     &before=`-`
 *     &toPlaceholder=`excluded_resources`
 * ]]
 *
 * @var modX $modx
 * @var array $scriptProperties;
 * @var string $input;
 * @var string $options;
 */

$input = $modx->getOption('input', $scriptProperties, $input);
$before = $modx->getOption('before', $scriptProperties, $options ?? '-');
$separator = $modx->getOption('separator', $scriptProperties, ',');
$placeholder = $modx->getOption('toPlaceholder', $scriptProperties, false);

if (!$input) return '';

$resourceArray = explode($separator,$input);

$output = array();
foreach ($resourceArray as $input) {
    $input = trim($input);

    // Maybe value is already prefixed
    if ($input[0] == $before) {
        $output[] = $input;
    } else {
        $output[] = $before . $input;
    }
}

$output = implode($separator, $output);

if ($placeholder) {
    $modx->toPlaceholder($placeholder, $output);
    return;
} else {
    return $output;
}