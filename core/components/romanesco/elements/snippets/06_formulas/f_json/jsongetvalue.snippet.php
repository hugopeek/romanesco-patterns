<?php
$input = $modx->getOption('json', $scriptProperties, $input);
$key = $modx->getOption('key', $scriptProperties, $options);
$tpl = $modx->getOption('tpl', $scriptProperties, '');
$outputSeparator = $modx->getOption('outputSeparator', $scriptProperties, ',');
$toPlaceholder = $modx->getOption('toPlaceholder', $scriptProperties, false);

// @todo: test if input is valid JSON, otherwise NULL is returned
$input = utf8_encode($input);
$array = json_decode($input, true);

// Single result from flat array
if ($array[$key]) {
    $output = $array[$key];

    if ($tpl) {
        $output = $modx->getChunk($tpl, array(
            'content' => $output
        ));
    }
};

// Multiple keys from multidimensional array
if (is_array($array[0])) {
    foreach ($array as $item) {
        $output[] = $item[0][$key];

        if ($tpl) {
            $output[] = $modx->getChunk($tpl, array(
                'content' => $output
            ));
        }
    }

    $output = implode(',',$output);
}

// Output either to placeholder, or directly
if ($toPlaceholder) {
    $modx->setPlaceholder($toPlaceholder, $output);
    return '';
}

return $output;