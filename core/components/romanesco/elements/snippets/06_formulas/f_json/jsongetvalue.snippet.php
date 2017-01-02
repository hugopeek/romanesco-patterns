<?php
$input = $modx->getOption('json', $scriptProperties);
$key = $modx->getOption('key', $scriptProperties);
$tpl = $modx->getOption('tpl', $scriptProperties, '');

$input = utf8_encode($input);
$array = json_decode($input, true);

$output = $array[$key];

if ($tpl) {
    $output = $modx->getChunk($tpl, array(
        'content' => $output
    ));
}

return $output;