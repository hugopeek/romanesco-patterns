<?php
/**
 * setBackground
 *
 * Set the appropriate classes for an applied Global Background.
 * For use in CB layout templates.
 *
 * Backwards compatible with the old, classname-based approach.
 */

$background = $modx->getOption('background', $scriptProperties, $input);
$cbField = $modx->getOption('romanesco.cb_field_background_id', $scriptProperties, '');

// Convert system default value
if ($background == 'default') {
    $background = $modx->getObject('cgSetting', array('key' => 'layout_background_default'))->get('value');
}

// Numeric value means it's a resource-based global background
if (is_numeric($background)) {
    $query = $modx->newQuery('modResource', $background);
    $query->select('alias');
    $alias = $modx->getValue($query->prepare());

    // Get inverted value from CB settings
    $inverted = $modx->runSnippet('cbGetFieldContent',array(
        'resource' => $background,
        'field' => $cbField,
        'fieldSettingFilter' => 'inverted==1',
        'returnAsJSON' => 1,
    ));

    // Default output is []
    if (strlen($inverted) > 2) {
        $inverted = ' inverted';
    } else {
        $inverted = '';
    }

    $background = $alias . $inverted . ' background';
}

return $background;