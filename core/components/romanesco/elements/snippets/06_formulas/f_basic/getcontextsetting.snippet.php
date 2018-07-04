<?php
/**
 * getContextSetting
 *
 * Useful for retrieving settings from a different context.
 * Used in the Head chunk for always looking for custom css on main domain.
 *
 * @author Bob Ray
 */

$ctx = $modx->getOption('context', $scriptProperties, null);
$setting = $modx->getOption('setting', $scriptProperties, null);

if ($ctx == null) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[getContextSetting] No Context set');
    return '';
} elseif ($setting === null) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[getContextSetting] No Setting set');
    return '';
} else {
    $csObj = $modx->getObject('modContextSetting',
        array(
            'context_key' => $ctx,
            'key' => $setting
        )
    );
}

if (is_object($csObj)) {
    return $csObj->get('value');
} else {
    $modx->log(modX::LOG_LEVEL_INFO, '[getContextSetting] Context Setting not found');
    return '';
}