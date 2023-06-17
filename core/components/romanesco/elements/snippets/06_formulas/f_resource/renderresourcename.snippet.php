<?php
/**
 * renderResourceName
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var string $input
 * @var string $options
 */

$id = $modx->getOption('id', $scriptProperties, $input);
$resource = $modx->getObject('modResource', $id);

if (is_object($resource)) {
    return $resource->get('pagetitle') . " ($id)";
}

return;