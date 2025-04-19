<?php
/**
 * replaceRegex
 *
 * Find patterns with regex and replace them.
 *
 * By default, it removes all matches. If you want to replace each match with
 * another string, you can use the double == format to define a replacement in
 * the output modifier, or specify the replace property in the snippet call.
 *
 * Usage:
 * [[*content:replaceRegex=`&uid=(.+)==&uid=`[[+unique_idx]]``]]
 * [[*content:replaceRegex=`^---[\s\S]+?---[\s]+`]] (removes YAML front matter)
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var string $input
 * @var string $options
 */

$input = $modx->getOption('input', $scriptProperties, $input);
$regex = $modx->getOption('pattern', $scriptProperties, $options);
$replace = $modx->getOption('replace', $scriptProperties, '');

if (!$input) return '';

if (str_contains($regex, '==')) {
    $regex = explode('==', $regex);
    $pattern = $regex[0];
    $replace = $regex[1];
} else {
    $pattern = $regex;
}

return preg_replace('/'.$pattern.'/', $replace, $input);