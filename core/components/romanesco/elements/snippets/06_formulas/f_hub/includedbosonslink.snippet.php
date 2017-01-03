<?php
$cbCorePath = $modx->getOption('contentblocks.core_path', null, $modx->getOption('core_path').'components/contentblocks/');
$ContentBlocks = $modx->getService('contentblocks','ContentBlocks', $cbCorePath.'model/contentblocks/');

$catID = $modx->getOption('category', $scriptProperties, '');

// Since we have an ID, let's go hunt for the category name
$category = $modx->getObject('cbCategory', array(
    'id' => $catID
));
$catName = strtolower($category->get('name'));

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

// @todo: Link to the corresponding anchor of the subject

return $link;