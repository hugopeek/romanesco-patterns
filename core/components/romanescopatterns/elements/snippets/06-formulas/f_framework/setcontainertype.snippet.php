<?php
// Not implemented yet!!
$parent = $modx->getOption('parent', $scriptProperties, '');
$id = $modx->getOption('id', $scriptProperties, '');
$pubparent = $modx->getOption('romanesco.publication_container_id', $scriptProperties, '');
$fullwidth = $modx->getOption('fullwidth', $scriptProperties, '');

if ($parent === $pubparent) {
    if ($fullwidth === 0) {
        $container_type = 'text';
    } else {
        $container_type = '';
    }
} else {
    return $fullwidth;
}

$modx->toPlaceholder('container_type', $container_type, $prefix);
$modx->toPlaceholder('prefix', $prefix);