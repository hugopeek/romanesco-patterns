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
 *
 * @var modX $modx
 * @var array $scriptProperties;
 */

$formID = $modx->getOption('formID', $scriptProperties, '');
$tplPrefix = $modx->getOption('tplPrefix', $scriptProperties, 'fbEmailRow_');
$tplSectionHeader = $modx->getOption('tplSectionHeader', $scriptProperties, '');
$reqOnly = $modx->getOption('requiredOnly', $scriptProperties, '');

if (!function_exists('getFields')) {
    function getFields(&$modx, $data, $prefix, $id, $reqOnly) {
        $result = '';

        foreach($data as $value) {
            if (!is_array($value)) {
                continue;
            }

            if (isset($value['field'])) {
                $value['settings']['id'] = $id;

                // Only return required fields if specified
                if ($reqOnly) {


                    // Some fields are always required
                    switch ($value['field']) {
                        case $modx->getOption('formblocks.cb_input_email_id'):
                            $value['settings']['field_required'] = 1;
                            $value['settings']['field_type'] = 'email';
                            break;
                        case $modx->getOption('formblocks.cb_accept_terms_id'):
                            $value['settings']['field_required'] = 1;
                            $value['settings']['field_type'] = 'terms';
                            break;
                        case $modx->getOption('formblocks.cb_math_question_id'):
                            $value['settings']['field_required'] = 1;
                            $value['settings']['field_type'] = 'math';
                            break;
                    }

                    //$modx->log(modX::LOG_LEVEL_ERROR, print_r($value['settings'],1));


                    if ($value['settings']['field_required'] != 1) {
                        continue;
                    }
                }

                $result .= $modx->getChunk($prefix.$value['field'], $value['settings']);
                continue;
            }

            $result .= getFields($modx, $value, $prefix, $id, $reqOnly);
        }

        return $result;
    }
}

if (!$formID) return '';
$forms = explode(',',$formID);
$output = array();

foreach ($forms as $formID) {
    $resource = $modx->getObject('modResource', $formID);
    $cbData = json_decode($resource->getProperty('content', 'contentblocks'), true);
    $result = '';

    // Only add header if there are multiple forms and a tpl chunk present
    if ($forms[1] && $tplSectionHeader) {
        $title = $resource->get('menutitle') ? $resource->get('menutitle') : $resource->get('pagetitle');
        $result .= $modx->getChunk($tplSectionHeader, array("title" => $title));
    }

    //$modx->log(modX::LOG_LEVEL_ERROR, print_r($cbData,1));

    $result .= getFields($modx, $cbData, $tplPrefix, $formID, $reqOnly);

    $output[] = $result;
}

return implode($output);