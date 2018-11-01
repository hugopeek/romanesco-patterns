<?php
$object = &$modx->getOption('object', $scriptProperties, null);
$properties = $modx->getOption('scriptProperties', $scriptProperties, array());

// Generate alias if empty
if (!$object->get('alias')) {
    $alias = $modx->runSnippet('stripAsAlias', (array('input' => $object->get('name'))));

    $object->set('alias', $alias);
    $object->save();
}

return '';