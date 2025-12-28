<?php
/**
 * Switch
 *
 * Created by Uros Likar
 * uros.likar@gmail.com
 *
 * Update to 1.1.0 by
 * Thomas Jakobi
 * thomas.jakobi@partout.info
 */

$default = $modx->getOption('default', $scriptProperties, '');
$get = trim($modx->getOption('get', $scriptProperties, false));

$output = $default;
if ($get !== false) {
    foreach ($scriptProperties as $key => $value) {
        if (substr($key, 0, 1) == 'c' && strlen($key) > 1 && isset($scriptProperties['do' . substr($key, 1)])) {
            if ($value == $get) {
                $output = $scriptProperties['do' . substr($key, 1)];
                break;
            }
        }
    }
}

// Output either to placeholder, or directly
$toPlaceholder = $modx->getOption('toPlaceholder', $scriptProperties, false);
if ($toPlaceholder) {
    $modx->setPlaceholder($toPlaceholder, $output);
    return '';
}
return $output;