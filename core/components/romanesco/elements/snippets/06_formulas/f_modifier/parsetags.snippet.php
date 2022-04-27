<?php
/**
 * parseTags
 *
 * Take in a comma separated string and turn each value into a separate tag.
 * Sometimes you just need that.
 *
 * Original by Mark Hamstra (http://www.markhamstra.nl).
 *
 * @var modX $modx
 * @var array $scriptProperties;
 * @var string $input;
 * @var string $options;
 */

$tpl = $modx->getOption('tpl', $scriptProperties, 'tagItemBasic');
$iconClass = $modx->getOption('iconClass', $scriptProperties, 'info');

if ($input == '') { return ''; } // Output filters are also processed when the input is empty, so check for that.
$tags = explode(',',$input); // Based on a delimiter of comma-space.
$output = array();

// Process them individually
foreach ($tags as $key => $value) {
    if (stripos($tpl,'flag') === false) {
        $value = ucfirst($value);
    }
    $output[] = $modx->getChunk($tpl,array(
        'tag' => $value,
        'icon_class' => $iconClass,
    ));
}

return implode('', $output);