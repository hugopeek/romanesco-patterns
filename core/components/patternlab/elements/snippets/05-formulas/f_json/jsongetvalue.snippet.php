<?php
$input = $modx->getOption('json', $scriptProperties);
$key = $modx->getOption('key', $scriptProperties);

$array = $modx->fromJSON($input);

foreach ($array as $result) {
    return $result[$key];
}