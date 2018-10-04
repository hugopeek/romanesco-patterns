<?php
/**
 * clipString
 *
 * Trim the edges of a string.
 *
 * If a negative value is used, this number of characters will be clipped from
 * the end. Otherwise, they are clipped from the start of the string.
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
 */

$input = $modx->getOption('input', $scriptProperties, $input);
$clip = $modx->getOption('clip', $scriptProperties, $options);

// Output filters are also processed when the input is empty, so check for that
if ($input == '') { return ''; }

// Decide whether to clip the start or end of the string
if ($clip < 0) {
    return mb_substr($input, 0, $clip);
} else {
    return mb_substr($input, $clip);
}