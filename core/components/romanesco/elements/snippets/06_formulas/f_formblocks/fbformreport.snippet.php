<?php
/**
 * fbFormReport Snippet
 *
 * Generates a report from submitted field values. Primarily used in email
 * responders of course, but you can also use this snippet to template other
 * kinds of functionality (confirmation pages, multi page forms..).
 *
 * @author Jsewill
 * @version 1.0
 *
 * &tplPrefix: Template chunk name prefix
 * &id: Resource ID of the resource where the form is being used
 */

function getFields(&$modx, $data, $prefix) {
    $result = '';

    foreach($data as $key => $value) {
        if(!is_array($value)) {
            continue;
        }

        if(isset($value['field'])) {
            $result .= $modx->getChunk($prefix.$value['field'], $value['settings']);
            continue;
        }

        $result .= getFields($modx, $value, $prefix);
    }

    return $result;
}

$output = '';

$tplPrefix = $modx->getOption('tplPrefix', $scriptProperties, 'fbEmailRow_');
$id = $modx->getOption('id', $scriptProperties, $modx->resource->get('id'));
$resource = $modx->getObject('modResource', $id);

$cbData = json_decode($resource->getProperty('content', 'contentblocks'), true);

$output .= getFields($modx, $cbData, $tplPrefix);

return $output;