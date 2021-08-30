<?php
$cbCorePath = $modx->getOption('contentblocks.core_path', null, $modx->getOption('core_path').'components/contentblocks/');
$ContentBlocks = $modx->getService('contentblocks','ContentBlocks', $cbCorePath.'model/contentblocks/');

$pattern = $modx->getOption('pattern', $scriptProperties, '');
$tpl = $modx->getOption('tpl', $scriptProperties, 'includedContentBlocksRow');

$htmlContentType = $modx->getObject('modContentType', array('name' => 'HTML'));

$output = array();
$fieldURI = 'patterns/bosons/fields';
$layoutURI = 'patterns/bosons/layouts';

// First, we need to know which CB elements contain the pattern name
// Let's start searching inside fields first, since they're the most common
$result = $modx->getCollection('cbField', array(
    'template:LIKE' => '%' . $pattern . '%',
    'OR:properties:LIKE' => '%' . $pattern . '%',
    'OR:settings:LIKE' => '%' . $pattern . '%'
));

// Proceed if any matches are present
if ($result) {
    // Turn each match into a list item with a link
    foreach ($result as $field) {
        $output[] = $modx->getChunk($tpl, array(
            'name' => $field->get('name'),
            'link' => $fieldURI,
            'label_classes' => 'blue'
        ));
    }

    return implode($output);
}

// Maybe the field type is Chunk, meaning it is referenced by ID instead of name
$query = $modx->newQuery('modChunk');
$query->where(array(
    'name' => $pattern
));
$query->select('id');
$patternID = $modx->getValue($query->prepare());

$result = $modx->getObject('cbField', array(
    'properties:LIKE' => '%"chunk":"' . $patternID . '"%'
));

if ($result) {
    return $modx->getChunk($tpl, array(
        'name' => $result->get('name'),
        'link' => $fieldURI,
        'assigned' => 1
    ));
}

// If no fields where found, try the layouts table instead
$result = $modx->getCollection('cbLayout', array(
    'template:LIKE' => '%' . $pattern . '%',
    'OR:settings:LIKE' => '%' . $pattern . '%'
));

// Proceed if any matches are present
if ($result) {
    // Turn each match into a list item with a link
    foreach ($result as $layout) {
        $output[] = $modx->getChunk($tpl, array(
            'name' => $layout->get('name'),
            'link' => $layoutURI,
            'label_classes' => 'teal'
        ));
    }

    return implode($output);
}

return '';