<?php
/**
 * renderContentType
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var string $input
 * @var string $options
 */

$id = $modx->getOption('id', $scriptProperties, $input);
$type = $modx->getObject('modContentType', $id);

if (is_object($type)) {
    return $type->get('name');
}

return;