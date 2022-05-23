<?php
/**
 * @var modX $modx
 */

$parents = $modx->getParentIds($modx->resource->get('id'));
return count($parents);