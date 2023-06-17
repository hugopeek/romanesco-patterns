<?php
/**
 * fbPrefixOutput
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var string $input
 * @var string $options
 */

$id = $modx->resource->get('id');
$options = !empty($options) ? $options: 'fb' . $id . '-';

return $options.$input;