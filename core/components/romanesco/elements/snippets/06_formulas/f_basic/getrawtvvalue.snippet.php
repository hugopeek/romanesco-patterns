<?php
/**
 * getRawTVValue
 *
 * Get the raw value of a TV.
 *
 * Usually when retrieving a TV value, it gets processed first before being returned. But sometimes you need the
 * unprocessed value instead, e.g. when using @inherit.",
 *
 * @var modX $modx
 * @var array $scriptProperties
 */

$resourceId = $modx->getOption('resource', $scriptProperties, $modx->resource->get('id'));
$tvName = $modx->getOption('tv', $scriptProperties, '');

// Get the TV
$tv = $modx->getObject('modTemplateVar', array('name'=>$tvName));

// Get the raw content of the TV
if (is_object($tv)) {
    $rawValue = $tv->getValue($resourceId);
    return $rawValue;
} else {
    return '';
}