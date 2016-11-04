<?php
$id = isset($id) ? $id : $modx->resource->get('id');
$pids = $modx->getParentIds($id, 100, array('context' => 'web'));
return count($pids);