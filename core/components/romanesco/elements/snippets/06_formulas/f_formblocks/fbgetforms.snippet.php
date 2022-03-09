<?php
/**
 * fbGetForms snippet
 *
 * @var modX $modx
 * @var array $scriptProperties
 *
 * @package romanesco
 */

if (!($modx->resource instanceof modResource)) return;

$context = $modx->getContext($modx->resource->get('context_key'));
$contextKey = $context->get('key');
$contextName = $context->get('name');
$parentID = $context->getOption('formblocks.container_id') ?? $modx->getOption('formblocks.container_id');

$output = $modx->runSnippet('getResources', (array(
    'parents' => $parentID,
    'limit' => 0,
    'depth' => 2,
    'showHidden' => 0,
    'showUnpublished' => 1,
    'tpl' => '@INLINE ['.$contextName.'] [[+pagetitle]]=[[+id]]',
    'sortby' => 'menuindex',
    'sortdir' => 'ASC',
    'where' => '[{"template:IN":[10,19]},{"uri:LIKE":"%/'.$contextKey.'/%"}]',
)));
if ($output) {
    $output .= "\n";
}
$output .= $modx->runSnippet('getResources', (array(
    'parents' => $parentID,
    'limit' => 0,
    'depth' => 0,
    'showHidden' => 0,
    'showUnpublished' => 1,
    'tpl' => '@INLINE [[+pagetitle]]=[[+id]]',
    'sortby' => 'menuindex',
    'sortdir' => 'ASC',
    'where' => '{"template:=":"10"}',
)));

return $output;