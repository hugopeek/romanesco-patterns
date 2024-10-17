<?php
/**
 * fbStripAsAlias
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var string $input
 * @var string $options
 */

return $modx->filterPathSegment($input, [
    'friendly_alias_restrict_chars' => 'alphanumeric'
]);