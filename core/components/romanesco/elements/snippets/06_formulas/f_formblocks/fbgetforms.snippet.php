<?php
if (!($modx->resource instanceof modResource)) return;

$context = $modx->getContext($modx->resource->get('context_key'));
$parentID = $context->getOption('formblocks.container_id') ?? $modx->getOption('formblocks.container_id');

$output = $modx->runSnippet('getResources', (array(
    'parents' => $parentID,
    'limit' => 0,
    'showHidden' => 0,
    'showUnpublished' => 1,
    'tpl' => '@INLINE [[+pagetitle]]=[[+id]]',
    'sortby' => 'menuindex',
    'sortdir' => 'ASC',
)));

return $output;