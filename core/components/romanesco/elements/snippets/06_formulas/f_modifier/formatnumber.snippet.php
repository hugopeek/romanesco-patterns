<?php
/**
 * formatNumber
 *
 * Add decimal and thousands separator to number string.
 * The appropriate separation characters are determined by the locale setting.
 *
 * Only works on numeric strings. If input is not numeric, it is returned as-is.
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var string $input
 * @var string $options
 */

$input = $modx->getOption('input', $scriptProperties, $input);
$locale = $modx->getOption('locale') ?: 'en_US';
if (is_numeric($input)) {
    $formatter = new NumberFormatter($locale, NumberFormatter::DECIMAL);
    return $formatter->format((float)$input);
}
return $input;