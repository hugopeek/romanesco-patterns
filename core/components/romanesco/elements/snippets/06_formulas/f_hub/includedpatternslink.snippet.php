<?php
$catID = $modx->getOption('input', $scriptProperties, '');

// Get category name and parent ID
$category = $modx->getObject('modCategory', array(
    'id' => $catID
));

if ($category) {
    $catName = $category->get('category');
    $parentID = $category->get('parent');
}

// If category or parent is empty, don't generate any link.
// All Romanesco elements are nested at least 1 level deep, so if a category
// has no parent, we can allow ourselves to assume it's part of a MODX extra.
if (!$category && $parentID == 0) {
    return;
}

// Get parent name as well, to avoid issues with multiple matches
$query = $modx->newQuery('modCategory', array(
    'id' => $parentID
));
$query->select('category');
$parentName = $modx->getValue($query->prepare());

// Grab only the last part of the category name
$catName = preg_match('([^_]+$)', $catName, $matchCat);
$parent = preg_match('([^_]+$)', $parentName, $matchParent);
$matchCat = strtolower($matchCat[0]);
$matchParent = strtolower($matchParent[0]);

// If category and parent are the same, squash them
if ($matchCat === $matchParent) {
    $match = $matchCat;
} else {
    $match = $matchParent . "/" . $matchCat;
}

// Get the resource with an alias that matches the category name
$link = $modx->runSnippet('pdoResources', (array(
    'parents' => '0',
    'context' => 'hub',
    'limit' => '1',
    'tpl' => '@INLINE [[+uri]]',
    'where' => '{ "uri:LIKE":"%' . $match . '" }'
)
));

// @todo: Link to the corresponding anchor of the subject

return $link;