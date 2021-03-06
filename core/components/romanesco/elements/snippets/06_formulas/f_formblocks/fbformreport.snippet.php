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
 * &tplPrefix: Template chunk name prefix.
 * &formID: Resource ID of the form. Can be a comma-separated list also, for
 *  processing multi-page forms.
 */

if (!function_exists('getFields')) {
    function getFields(&$modx, $data, $prefix, $id) {
        $result = '';

        foreach($data as $key => $value) {
            if(!is_array($value)) {
                continue;
            }

            if(isset($value['field'])) {
                $value['settings']['id'] = $id;
                $result .= $modx->getChunk($prefix.$value['field'], $value['settings']);
                continue;
            }

            $result .= getFields($modx, $value, $prefix, $id);
        }

        return $result;
    }
}

$output = array();

$formID = $modx->getOption('formID', $scriptProperties, '');
$tplPrefix = $modx->getOption('tplPrefix', $scriptProperties, 'fbEmailRow_');
$tplSectionHeader = $modx->getOption('tplSectionHeader', $scriptProperties, '');

if (!$formID) return '';
$forms = explode(',',$formID);

foreach ($forms as $formID) {
    $resource = $modx->getObject('modResource', $formID);
    $cbData = json_decode($resource->getProperty('content', 'contentblocks'), true);
    $result = '';

    // Only add header if there are multiple forms and a tpl chunk present
    if ($forms[1] && $tplSectionHeader) {
        $title = $resource->get('menutitle') ? $resource->get('menutitle') : $resource->get('pagetitle');
        $result .= $modx->getChunk($tplSectionHeader, array("title" => $title));
    }

    $result .= getFields($modx, $cbData, $tplPrefix, $formID);

    $output[] = $result;
}

return implode($output);