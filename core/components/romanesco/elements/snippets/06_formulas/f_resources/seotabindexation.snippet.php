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
//$resource =& $modx->event->params['resource'];

if (is_object($resource)) {
    $properties = $resource->getProperties('stercseo');
}

if (!$properties) {
    return '';
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