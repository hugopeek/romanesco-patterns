<?php
$cbCorePath = $modx->getOption('contentblocks.core_path', null, $modx->getOption('core_path').'components/contentblocks/');
$ContentBlocks = $modx->getService('contentblocks','ContentBlocks', $cbCorePath.'model/contentblocks/');
$ContentBlocks->loadInputs();

$cbField = $modx->getOption('cbField', $scriptProperties, '');
$cbLayout = $modx->getOption('cbLayout', $scriptProperties, '');
$prefix = $modx->getOption('prefix', $scriptProperties, 'cb');

if ($cbField != '') {
    $field = $modx->getObject('cbField', array(
        'name' => $cbField
    ));

    // Turn object into array
    $array = $field->toArray();
    // Set all fields as placeholders
    // Use a prefix to prevent collisions
    $modx->toPlaceholders($array, $prefix);

    // Set placeholder with all field settings parsed in an HTML table
    $settingsTable = $modx->runSnippet('jsonToHTML', array(
        'json' => $field->get('settings')
    ));
    $modx->toPlaceholder('settings_table', $settingsTable, $prefix);

    // Set placeholder with wrapper template, if present inside properties field
    $properties = $field->get('properties');
    if (strpos($properties, 'wrapper_template') !== false) {
        // Get the wrapper_template value from its JSON container
        $wrapperTemplate = $modx->runSnippet('jsonGetValue', array(
            'json' => $properties,
            'key' => 'wrapper_template',
            'tpl' => 'displayRawTemplate'
        ));
    }
    $modx->toPlaceholder('wrapper_template', $wrapperTemplate, $prefix);
}

if ($cbLayout != '') {
    $layout = $modx->getObject('cbLayout', array(
        'name' => $cbLayout
    ));

    $json = $layout->get('settings');
}

// Set separate placeholder with prefix, for easier retrieval of the other placeholders
// Usage example: [[+[[+prefix]].placeholder]]
$modx->toPlaceholder('prefix', $prefix);

//print_r($json);