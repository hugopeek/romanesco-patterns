<?php
$tvName = $modx->getOption('tv', $scriptProperties, '');

// Get the TV by name
$tv = $modx->getObject('modTemplateVar',array('name'=>$tvName));

// Get the ID of the TV
$id = $tv->get('id');

return $id;