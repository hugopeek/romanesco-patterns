<?php
/**
 * renderReferringPages
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var string $input
 * @var string $options
 */

$id = $modx->getOption('id', $scriptProperties, $scriptProperties['row']['id'] ?? '');
$column = $modx->getOption('column', $scriptProperties);

//$modx->log(modX::LOG_LEVEL_ERROR, print_r($scriptProperties,1));
//$modx->log(modX::LOG_LEVEL_ERROR, $column);

$where = '';
switch ($column) {
    case 'referring_pages_form':
        $where = '[{ "properties:LIKE":"%\"form_id\":\"' . $id . '\"%" }]';
        break;
    case 'referring_pages_cta':
        $where = '[{ "properties:LIKE":"%\"cta_id\":\"' . $id . '\"%" }]';
        break;
    case 'referring_pages_background':
        $where = '[{ "properties:LIKE":"%background_____' . $id . '__,%" }]';
        break;
}

if (!$where) return;

$output = $modx->runSnippet('pdoMenu', (array(
    'parents' => '',
    'context' => 'web,global,hub,notes',
    'limit' => 0,
    'depth' => 0,
    'showHidden' => 1,
    'showUnpublished' => 1,
    'tplOuter' => '@INLINE <ul>[[+wrapper]]</ul>',
    'tpl' => '@INLINE <li><a href="[[~[[+id]]]]" target="_blank">[[+pagetitle]]</a> ([[+id]])</li>',
    'sortby' => 'menuindex',
    'sortdir' => 'ASC',
    'where' => $where,
)));


return $output;