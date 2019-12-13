<?php
/**
 * fbFormReport snippet
 *
 * Generates a report email for FormBlocks forms.
 *
 * @author Jsewill
 * @version 0.1
 *
 * &tplPrefix   Template chunk name prefix
 * &id          Resource ID of the resource where the form is being used
 *
 */

function getFields(&$modx, $data, $prefix) {
    $result = '';

    foreach($data as $key => $value) {
        if(!is_array($value)) {
            continue;
        }

        if(isset($value['field'])) {
            $result .= $modx->getChunk($prefix.$value['field'], $value['settings']);
            continue;
        }

        $result .= getFields($modx, $value, $prefix);
    }

    return $result;
}

$output = '';

$tplPrefix = $modx->getOption('tplPrefix', $scriptProperties, 'fbEmailRow_');
$id = $modx->getOption('id', $scriptProperties, $modx->resource->get('id'));
$resource = $modx->getObject('modResource', $id);

$cbdata = json_decode($resource->getProperty('content', 'contentblocks'), true);
$cbsettings = $modx->getIterator('modSystemSetting', array('namespace'=>'romanesco', 'key:LIKE'=>'formblocks.cb_%'));

$output .= getFields($modx, $cbdata, $tplPrefix);

return $output;