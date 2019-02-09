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
$seoTab = $modx->getObject('modPlugin', array('name'=>'StercSEO','disabled'=>0));
//$resource =& $modx->event->params['resource'];

// First, check if SEOTab plugin is installed, and active
if (!is_object($seoTab)) {
    return '';
}

if (is_object($resource)) {
    $properties = $resource->getProperties('stercseo');
}

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

return $index . '/' . $follow;