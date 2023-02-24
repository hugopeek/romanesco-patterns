<?php
/**
 * fbSetStoredValues snippet
 *
 * Populate field values with available data stored in the user session.
 * Enabled by default when using multi-page forms.
 *
 * NB! This only applies to fields in the current step. Other steps still rely
 * on FormItRetriever for populating the hidden fields in each form.
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var FormIt $formit
 * @var fiHooks $hook
 *
 * @package romanesco
 */

// Erase session data if it's no longer valid
if (Time() > $_SESSION['formitStore']['valid']) {
    $_SESSION['formitStore'] = '';
    return true;
}

// Get and set stored values
$storedValues = $_SESSION['formitStore']['data'];
$hook->setValues($storedValues);

return true;