<?php
/**
 * replaceRegex
 *
 * Find patterns with regex and replace them.
 *
 * By default, it removes all matches. If you want to replace each match with
 * something else, you have to use a regular snippet call.
 *
 * @example [[*content:replaceRegex=`^---[\s\S]+?---[\s]+`]]
 * (removes YAML front matter)
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var string $input
 * @var string $options
 */

$input = $modx->getOption('input', $scriptProperties, $input);
$regex = $modx->getOption('pattern', $scriptProperties, $options);
$replace = $modx->getOption('replacement', $scriptProperties, '');
if ($input) {
    return preg_replace('/' . $regex . '/', $replace, $input);
}
return '';