<?php
// Get category name and parent ID
$cat = $modx->getObject('modCategory', $input, '');
$category = $cat->get('category');
$parentID = $cat->get('parent');

// Get parent name as well, to avoid issues with multiple matches
$query = $modx->newQuery('modCategory', array(
    'id' => $parentID
));
$query->select('category');
$parentName = $modx->getValue($query->prepare());

// Grab only the last part of the category name
$category = preg_match('([^_]+$)', $category, $matchCat);
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