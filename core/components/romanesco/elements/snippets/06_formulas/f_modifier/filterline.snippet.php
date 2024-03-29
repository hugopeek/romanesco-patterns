<?php
/**
 * filterLine
 *
 * Search input for lines containing a specific string. And then return those
 * lines.
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var string $input
 * @var string $options
 */

$lines = $modx->getOption('input', $scriptProperties, $input);
$file = $modx->getOption('file', $scriptProperties, '');
$search = $modx->getOption('searchString', $scriptProperties, $options);
$limit = $modx->getOption('limit', $scriptProperties, 10);
$tpl = $modx->getOption('tpl', $scriptProperties, '');

// Check first if we're dealing with an external file
if ($file) {
    $lines = file_get_contents($file);
}

// Create an array of all lines inside the input
$lines = explode("\n", $lines);
$i = 0;
$output = [];

// Check if the line contains the string we're looking for, and print if it does
foreach ($lines as $line) {
    if(strpos($line, $search) !== false) {
        $output[] = $line;

        $i++;
        if($i >= $limit) {
            break;
        }

        if ($tpl) {
            $output[] = $modx->getChunk($tpl, array(
                'content' => $line,
            ));
        }
    }
}

if ($output) {
    return implode('<br>', $output);
}

return '';