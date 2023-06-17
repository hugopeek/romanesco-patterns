<?php
/**
 * clipString
 *
 * Trim a certain amount of characters from the edges of a string.
 *
 * If a negative value is used, this number of characters will be clipped from
 * the end. Otherwise, they are clipped from the start of the string.
 *
 * If no value is given, whitespace is trimmed from the edges.
 *
 * Usage examples:
 *
 * [[*your_tv:clipString=`-1`]]
 * (if the value of your_tv is 'https', this will return 'http')
 *
 * [[clipString?
 *     &input=`[[+some_string]]`
 *     &clip=`1`
 * ]]
 * (if your string is 'your website', this will return 'our website')
 *
 * You can also clip both edges:
 *
 * [[*your_tv:clipString=`8`:clipString=`-1`]]
 * (if your_tv is 'https://your_website/', this will return 'your_website')
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var string $input
 * @var string $options
 */

$input = $modx->getOption('input', $scriptProperties, $input);
$clip = (int) $modx->getOption('clip', $scriptProperties, $options);

// Output filters are also processed when the input is empty, so check for that
if ($input == '') { return ''; }

// Only trim whitespace if clip is not defined
if (!$clip) {
    return trim($input);
}

// Decide whether to clip the start or end of the string
if ($clip < 0) {
    return mb_substr($input, 0, $clip);
} else {
    return mb_substr($input, $clip);
}