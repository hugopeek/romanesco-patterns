<?php
$id = $modx->getOption('id', $scriptProperties, $input);
$type = $modx->getObject('modContentType', $id);

if (is_object($type)) {
    return $type->get('name');
}

return;