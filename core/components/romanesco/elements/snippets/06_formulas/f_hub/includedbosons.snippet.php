<?php
/**
 * includedBosons
 *
 * List all ContentBlocks fields being used in a given layout, or if no layout
 * is specified, on a given page.
 *
 * @author Hugo Peek
 */

$cbCorePath = $modx->getOption('contentblocks.core_path', null, $modx->getOption('core_path').'components/contentblocks/');
$ContentBlocks = $modx->getService('contentblocks','ContentBlocks', $cbCorePath.'model/contentblocks/');

$resourceID = $modx->getOption('resource', $scriptProperties, $modx->resource->get('id'));
$layoutIdx = $modx->getOption('layout', $scriptProperties, '');
$filterFields = $modx->getOption('filterFields', $scriptProperties, '6,14,17,87');
$tpl = $modx->getOption('tpl', $scriptProperties, 'includedContentBlocksRow');

// Function to turn result into a link to its corresponding resource
// @todo: This function is also being used in the referringBosons snippet.. Could this somehow be loaded from 1 file?
if (!function_exists('createLink')) {
    function createLink($catID) {
        global $modx;

        // Since we have an ID, let's go hunt for the category name
        $category = $modx->getObject('cbCategory', array(
            'id' => $catID
        ));

        if ($category) {
            $catName = strtolower($category->get('name'));
        } else {
            $modx->log(modX::LOG_LEVEL_WARN, '[includedBosons] Link could not be generated due to missing category ID');
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

// Function to look for a key in a multi level array
if (!function_exists('recursive_array_search')) {
    function recursive_array_search(array $array, $needle) {
        $result = array();
        $iterator  = new RecursiveArrayIterator($array);
        $recursive = new RecursiveIteratorIterator(
            $iterator,
            RecursiveIteratorIterator::SELF_FIRST
        );
        foreach ($recursive as $key => $value) {
            if ($key === $needle) {
                $result[] = $value;
            }
        }
        return $result;
    }
}

// Get the properties of the current resource first
$query = $modx->newQuery('modResource', array(
    'id' => $resourceID
));
$query->select('properties');
$properties = $modx->getValue($query->prepare());

// Prepare an array with just the content part
$array = json_decode($properties, true);
$array = json_decode($array['contentblocks']['content'], true);

// Pick the current layout from the array, based on idx
$result = $array[$layoutIdx];

// Great! Now let's get all field IDs from this array
$result = recursive_array_search($result, 'field');
$result = array_unique($result);

// @todo: Filter user specified field IDs from results

if ($result) {
    // Turn each match into a list item with a link
    foreach ($result as $id) {
        $boson = $modx->getObject('cbField', array(
            'id' => $id
        ));
        $name = $boson->get('name');
        $link = createLink($boson->get('category'));

        $output[] = $modx->getChunk($tpl, array(
            'name' => $name,
            'link' => $link
        ));
    }

    return implode($output);
}