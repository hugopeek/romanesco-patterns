<?php
/**
 * stripAsAlias
 *
 * Turn input into lowercase-hyphen-separated-alias-format and strip unwanted
 * special characters. Useful for creating anchor links based on headings, for
 * example.
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var string $input
 * @var string $options
 */

return $modx->filterPathSegment($input, [
    'friendly_alias_restrict_chars' => 'alphanumeric'
]);