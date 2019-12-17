<?php
/**
 * fbValidateProcessJSON
 *
 * A snippet for FormBlocks that generates the correct strings for the FormIt &validate property.
 *
 * @author Hugo Peek
 * @var $scriptProperties
 */

$input = $modx->getOption('json', $scriptProperties);
$fields = $modx->fromJSON($input);
$id = $modx->resource->get('id');
$prefix = !empty($prefix) ? $prefix: 'fb' . $id . '-';
$emailField = $modx->getOption('emailField', $scriptProperties);

//$jsonString = $modx->getOption('json', $scriptProperties);
//$array = json_decode($jsonString, true);

// Function to strip required field names correctly
if (!function_exists('stripResults')) {
    function stripResults($input) {
        global $modx;
        return $modx->runSnippet('fbStripAsAlias', array('input' => $input));
    }
}

// Go through JSON array and collect all required fields
//$fields = search($array, 'field_required', '1');
$output = array();

foreach ($fields as $field) {
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