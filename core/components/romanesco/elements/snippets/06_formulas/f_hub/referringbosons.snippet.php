<?php
$cbCorePath = $modx->getOption('contentblocks.core_path', null, $modx->getOption('core_path').'components/contentblocks/');
$ContentBlocks = $modx->getService('contentblocks','ContentBlocks', $cbCorePath.'model/contentblocks/');

$pattern = $modx->getOption('pattern', $scriptProperties, '');
$tpl = $modx->getOption('tpl', $scriptProperties, 'includedContentBlocksRow');

// Function to turn result into a link to its corresponding resource
if (!function_exists('createLink')) {
    function createLink($catID) {
        global $modx;

        // Since we have an ID, let's go hunt for the category name
        $category = $modx->getObject('cbCategory', array(
            'id' => $catID
        ));

        if ($category) {
            $catName = strtolower($category->get('name'));
        }

        // Use bosons as parent name, because we don't know if this is a layout or field
        $parentName = 'bosons';

        // Get the resource with an alias that matches both category and parent name
        $query = $modx->newQuery('modResource');
        $query->where(array(
            'uri:LIKE' => '%' . $parentName . '%',
            'AND:uri:LIKE' => '%' . $catName,
        ));
        $query->select('uri');
        $link = $modx->getValue($query->prepare());

        return $link;
    }
}

// First, we need to know which CB elements contain the pattern name
// Let's start searching inside fields first, since they're the most common
$cbField = $modx->getCollection('cbField', array(
    'template:LIKE' => '%' . $pattern . '%',
    'OR:properties:LIKE' => '%' . $pattern . '%',
    'OR:settings:LIKE' => '%' . $pattern . '%'
));

// Set matches if any fields where found
if ($cbField) {
    $matches = $cbField;
}

// If no fields where found, try the layouts table instead
if (!$cbField) {
    $cbLayout = $modx->getCollection('cbLayout', array(
        'template:LIKE' => '%' . $pattern . '%',
        'OR:settings:LIKE' => '%' . $pattern . '%'
    ));

    $matches = $cbLayout;
}

// Proceed if any matches are present
if ($matches) {
    // Turn each match into a list item with a link
    foreach ($matches as $match) {
        $name = $match->get('name');
        $link = createLink($match->get('category'));

        $output[] = $modx->getChunk($tpl, array(
            'name' => $name,
            'link' => $link
        ));
    }

    return(implode($output));
}