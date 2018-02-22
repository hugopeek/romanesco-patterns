<?php
$resourceId = $modx->getOption('resource', $scriptProperties, $modx->resource->get('id'));
$tvName = $modx->getOption('tv', $scriptProperties, '');

// Get the TV
$tv = $modx->getObject('modTemplateVar',array('name'=>$tvName));

// Get the raw content of the TV
if (is_object($tv)) {
    $rawValue = $tv->getValue($resourceId);

    return $rawValue;
}
else {
    return '';
}