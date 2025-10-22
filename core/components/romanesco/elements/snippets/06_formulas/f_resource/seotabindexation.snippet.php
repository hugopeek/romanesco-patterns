<?php
/**
 * SeoTabIndexation
 *
 * If SeoTab (StercSEO) is installed, this snippet displays the indexation
 * setting for given resource.
 *
 * Can be used as output modifier:
 *
 * [[+id:SeoTabIndexation]]
 */

$resourceID = $modx->getOption('resource', $scriptProperties, $input);
$resource = $modx->getObject('modResource', $resourceID);
$seoTab = $modx->getObject('modPlugin', array('name'=>'SEO Suite','disabled'=>0));
//$resource =& $modx->event->params['resource'];
$placeholder = $modx->getOption('toPlaceholder', $scriptProperties, false);

// First, check if SEOTab plugin is installed, and active
if (!is_object($seoTab) || !is_object($resource)) {
    return '';
}

$properties = $resource->getProperties('stercseo');

if ($properties['index'] == 1) {
    $index = 'index';
} else {
    $index = 'noindex';
}

if ($properties['follow'] == 1) {
    $follow = 'follow';
} else {
    $follow = 'nofollow';
}

$output = $index . '/' . $follow;
if ($placeholder) {
    $modx->setPlaceholder($placeholder, $output);
    return '';
}
return $output;