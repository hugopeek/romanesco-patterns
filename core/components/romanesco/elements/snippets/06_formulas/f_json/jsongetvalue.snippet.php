<?php
/**
 * jsonGetValue
 *
 * Get the value of a specific key from a JSON string.
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var string $input
 * @var string $options
 */
use FractalFarming\Romanesco\Romanesco;

/** @var Romanesco $romanesco */
try {
    $romanesco = $modx->services->get('romanesco');
} catch (\Psr\Container\NotFoundExceptionInterface $e) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[Romanesco3x] ' . $e->getMessage());
}

$input = $modx->getOption('json', $scriptProperties, $input);
$key = $modx->getOption('key', $scriptProperties, $options);
$tpl = $modx->getOption('tpl', $scriptProperties, '');
$outputSeparator = $modx->getOption('outputSeparator', $scriptProperties, ',');
$toPlaceholder = $modx->getOption('toPlaceholder', $scriptProperties, false);

// @todo: test if input is valid JSON, otherwise NULL is returned
$input = utf8_encode($input);
$array = json_decode($input, true);
$output = '';

// Flatten first level, since that's always the full JSON object itself
$array = $array[0];

// Single result from flat array
if ($array[$key]) {
    $output = $array[$key];

    if ($tpl) {
        $output = $modx->getChunk($tpl, array(
            'content' => $output
        ));
    }
};

// Single key from multidimensional array
if (is_array($array)) {
    $output = $romanesco->recursiveArraySearch($array, $key);
    
    if ($tpl) {
        $output = $modx->getChunk($tpl, array(
            'content' => $output
        ));
    }

    $output = implode($output);
}

// Output either to placeholder, or directly
if ($toPlaceholder) {
    $modx->setPlaceholder($toPlaceholder, $output);
    return '';
}

return $output;