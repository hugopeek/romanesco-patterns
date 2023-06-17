<?php
/**
 * getTmplvarID
 *
 * Get the ID of a TV, in case you only know its name.
 * Created for the front-end library, to help with listing included TVs.",
 *
 * @var modX $modx
 * @var array $scriptProperties
 */

$tvName = $modx->getOption('tv', $scriptProperties, '');

// Get the TV by name
$tv = $modx->getObject('modTemplateVar',array('name'=>$tvName));

// Get the ID of the TV
if (is_object($tv)) {
    $id = $tv->get('id');
    return $id;
} else {
    return '';
}