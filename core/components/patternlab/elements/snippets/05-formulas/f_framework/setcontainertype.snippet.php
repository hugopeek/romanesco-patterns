<?php
$parent = $modx->getOption('parent', $scriptProperties, '');
$id = $modx->getOption('id', $scriptProperties, '');
$blogparent = $modx->getOption('patternlab.blog_container_id', $scriptProperties, '');
$fullwidth = $modx->getOption('fullwidth', $scriptProperties, '');

if ($parent === $blogparent) {
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