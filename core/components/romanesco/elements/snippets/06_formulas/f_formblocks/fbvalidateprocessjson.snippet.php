<?php
/**
 * fbValidateProcessJSON
 *
 * A snippet for FormBlocks that generates the correct strings for the FormIt &validate property.
 *
 * @var modX $modx
 * @var array $scriptProperties
 */

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
    $required = $field['settings']['field_required'] ?? 0;
    if ($required != 1) {
        continue;
    }

    // Get field name and format as alias
    $fieldName = $field['settings']['field_name_html'] ?? '';
    if (!$fieldName) {
        $fieldName = $field['settings']['field_name'] ?? '';
    }
    $fieldName = $modx->runSnippet('fbStripAsAlias', array('input' => $fieldName));

    // Special treatment for date fields
    if ($field['field'] == $modx->getOption('formblocks.cb_input_date_range_id', $scriptProperties)) {
        $output[] = $prefix . $fieldName . "-start:isDate:required,";
        $output[] = $prefix . $fieldName . "-end:isDate:required,";
        continue;
    }
    if ($field['field'] == $modx->getOption('formblocks.cb_input_date_id', $scriptProperties)) {
        $output[] = $prefix . $fieldName . ":isDate:required,";
        continue;
    }

    // All remaining fields
    $output[] = $prefix . $fieldName . ":required,";
}

return implode('', $output);