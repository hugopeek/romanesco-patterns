<?php
/**
 * renderReferringPages
 *
 * Takes an ID as input and returns a list of pages in which this resource is
 * referenced. Intended as snippet renderer for Collections, to show where Forms,
 * CTAs and Backgrounds are being used.
 *
 * Scans content and TVs. Note that for TVs, inherited values are not evaluated.
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var string $input
 * @var string $options
 */

$id = $modx->getOption('id', $scriptProperties, $scriptProperties['row']['id'] ?? '');
$column = $modx->getOption('column', $scriptProperties);

$where = '';

// Content
switch ($column) {
    case 'referring_pages_form':
        $where = '{ "properties:LIKE":"%\"form_id\":\"' . $id . '\"%" }';
        break;
    case 'referring_pages_cta':
        $where = '{ "properties:LIKE":"%\"cta_id\":\"' . $id . '\"%" }';
        break;
    case 'referring_pages_background':
        $where = '{ "properties:LIKE":"%background_____' . $id . '__,%" }';
        break;
}

if (!$where) return;

// TVs
$tvValues = [];
$tvValuesHead = $modx->getCollection('modTemplateVarResource', [
    'tmplvarid' => 3, // header_cta
    'value' => $id
]);
$tvValuesFooter = $modx->getCollection('modTemplateVarResource', [
    'tmplvarid' => 104, // footer_cta
    'value' => $id
]);
$tvValuesSidebar = $modx->getCollection('modTemplateVarResource', [
    'tmplvarid' => 148, // sidebar_cta
    'value' => $id
]);

foreach ($tvValuesHead as $value) {
    $tvValues[] = $value->get('contentid');
}
foreach ($tvValuesFooter as $value) {
    $tvValues[] = $value->get('contentid');
}
foreach ($tvValuesSidebar as $value) {
    $tvValues[] = $value->get('contentid');
}

if ($tvValues) {
    $where .= ',{ "OR:id:IN": [' . implode(',', $tvValues) . '] }';
}

$output = $modx->runSnippet('pdoMenu', (array(
    'parents' => '',
    'context' => '',
    'limit' => 0,
    'depth' => 0,
    'showHidden' => 1,
    'showUnpublished' => 1,
    'tplOuter' => '@INLINE <ul>[[+wrapper]]</ul>',
    'tpl' => '@INLINE <li><a href="[[~[[+id]]]]" target="_blank">[[+pagetitle]]</a> ([[+id]])</li>',
    'sortby' => 'menuindex',
    'sortdir' => 'ASC',
    'where' => "[$where]",
)));


return $output;