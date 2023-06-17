<?php
/**
 * stripWords
 *
 * As opposed to the native MODX stripString modifier (which only allows you to
 * strip a single value), stripWords lets you enter multiple (comma separated)
 * values.
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var string $input
 * @var string $options
 */

$words = array_map('trim', explode(',', $options));
return str_replace($words, '', $input);