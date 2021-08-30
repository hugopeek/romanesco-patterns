<?php
$categoryID = $modx->getOption('input', $scriptProperties, '');
$pattern = $modx->getOption('pattern', $scriptProperties, '');
$placeholder = $modx->getOption('toPlaceholder', $scriptProperties, '');
$prefix = $modx->getOption('prefix', $scriptProperties, '');

$htmlContentType = $modx->getObject('modContentType', array('name' => 'HTML'));

// Get category object
$category = $modx->getObject('modCategory', array(
    'id' => $categoryID
));

if (!is_object($category)) return;

$modx->toPlaceholder('category', $categoryID, $prefix);
$modx->toPlaceholder('pattern', $pattern, $prefix);

// Grab only the last part of the category name
$categoryName = preg_match('([^_]+$)', $category->get('category'), $matchCategory);

// Get parent as well
$parent = $modx->getObject('modCategory', array(
    'id' => $category->get('parent')
));

// If parent is empty, don't generate any link.
// All Romanesco elements are nested at least 1 level deep, so if a category
// has no parent, we can assume it's part of a MODX extra.
if (!is_object($parent)) {
    $modx->toPlaceholder('pl', $prefix);
    return;
}

// Grab last part of parent category name
$parentName = preg_match('([^_]+$)', $parent->get('category'), $matchParent);

// Grab parent categories one level deeper
$query = $modx->newQuery('modCategory', array(
    'id' => $parent->get('parent')
));
$query->select('category');
$parentParent = $modx->getValue($query->prepare());
$parentParentName = preg_match('([^_]+$)', $parentParent, $matchParentParent);

// Collect matches
$matchCategory = strtolower($matchCategory[0]);
$matchParent = strtolower($matchParent[0]);
$matchParentParent = strtolower($matchParentParent[0]);

// Find resource with an alias that matches any of the collected category names
$query = $modx->newQuery('modResource');
$query->where(array(
    'published' => 1,
    array(
        'uri:LIKE' => '%patterns%' . $matchCategory . $htmlContentType->get('file_extensions'),
    ),
    array(
        'OR:uri:LIKE' => '%patterns%' . $matchParent . $htmlContentType->get('file_extensions'),
    ),
    array(
        'OR:uri:LIKE' => '%patterns%' . $matchParentParent . $htmlContentType->get('file_extensions'),
    )
));
$query->select('uri');
$link = $modx->getValue($query->prepare());

//$modx->toPlaceholder('category', $category->get('category'), $prefix);
//$modx->toPlaceholder('parent', $parent->get('category'), $prefix);
//$modx->toPlaceholder('parent2', $parentParent, $prefix);

// Add anchor already, if pattern name is defined
if ($pattern) {
    $link = $link . '#' . strtolower($pattern);
}

// Output to placeholder if one is set
if ($placeholder) {
    $modx->toPlaceholder('pl', $prefix);
    $modx->toPlaceholder($placeholder, $link, $prefix);
    return '';
} else {
    return $link;
}