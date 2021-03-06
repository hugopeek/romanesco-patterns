<?php
/**
 * fbValidateProcessJSON
 *
 * A snippet for FormBlocks that generates the correct strings for the FormIt &validate property.
 *
 * @author Hugo Peek
 * @var $scriptProperties
 */

// Function to strip required field names correctly
if (!function_exists('stripResults')) {
    function stripResults($input) {
        global $modx;
        return $modx->runSnippet('fbStripAsAlias', array('input' => $input));
    }
}

$formID = $modx->getOption('formID', $scriptProperties,'');

if ($formID) {
    $resource = $modx->getObject('modResource', $formID);
} else {
    $resource = $modx->resource;
    $formID = $resource->get('id');
}

if (!is_object($resource) || !($resource instanceof modResource)) return '';

$prefix = $modx->getOption('prefix', $scriptProperties,'fb' . $formID . '-');
$cbData = $resource->getProperty('linear', 'contentblocks');
$output = array();

// Go through CB data and collect all required fields
foreach ($cbData as $field) {
    if ($field['settings']['field_required'] != 1) {
        continue;
    }

    // Special treatment for date fields
    if ($field['field'] == $modx->getOption('formblocks.cb_input_date_range_id', $scriptProperties)) {
        $output[] = $prefix . stripResults($field['settings']['field_name']) . "-start:isDate:required,";
        $output[] = $prefix . stripResults($field['settings']['field_name']) . "-end:isDate:required,";
        continue;
    }
    if ($field['field'] == $modx->getOption('formblocks.cb_input_date_id', $scriptProperties)) {
        $output[] = $prefix . stripResults($field['settings']['field_name']) . ":isDate:required,";
        continue;
    }

    // All remaining fields
    $output[] = $prefix . stripResults($field['settings']['field_name']) . ":required,";
}

return implode('', $output);