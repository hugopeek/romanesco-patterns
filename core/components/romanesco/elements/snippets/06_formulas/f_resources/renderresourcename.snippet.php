<?php
$resource = $modx->getObject('modResource', $input);

if (is_object($resource)) {
    return $resource->get('pagetitle') . " ($input)";
}

return;