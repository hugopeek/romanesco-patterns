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

// Numeric value means it's a resource-based background
if (is_numeric($background)) {
    $query = $modx->newQuery('modResource', $background);
    $query->select('alias');
    $alias = $modx->getValue($query->prepare());

    // Get inverted value from CB settings
    $inverted = $modx->runSnippet('cbGetFieldContent',array(
        'resource' => $background,
        'field' => 100034,
        'fieldSettingFilter' => 'inverted==1',
        'returnAsJSON' => 1,
    ));

    // Default output is []
    if (strlen($inverted) > 2) {
        $inverted = ' inverted';
    } else {
        $inverted = '';
    }

    return $alias . $inverted . ' background';
}

// For backwards compatibility, return the old classes by default
return $background;