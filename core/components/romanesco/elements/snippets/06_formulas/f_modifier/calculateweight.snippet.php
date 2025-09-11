<?php
/**
 * calculateWeight snippet
 *
 * Match input number with a size attribute.
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var string $input
 * @var string $options
 */

$input = $modx->getOption('input', $scriptProperties, $input);
$median = $modx->getOption('median', $scriptProperties, $options);

if (!$input) return '';

$input = (int)$input;
$median = (int)$median ?: 5;
$output = 'mini';

if ($input > ($median / 3)) $output = 'tiny';
if ($input > ($median / 2)) $output = 'small';
if ($input > ($median / 1)) $output = 'medium';
if ($input > ($median * 1.5)) $output = 'large';
if ($input > ($median * 2)) $output = 'big';
if ($input > ($median * 2.5)) $output = 'huge';
if ($input > ($median * 3)) $output = 'massive';

return $output;