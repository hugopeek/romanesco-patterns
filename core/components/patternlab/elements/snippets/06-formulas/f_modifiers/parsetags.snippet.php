<?php
/*
 * parseTags output filter
 * by Mark Hamstra (http://www.markhamstra.nl)
 * free to use / modify / distribute to your will
 */

$tpl = $modx->getOption('tpl', $scriptProperties, 'tagItemBasic');

if ($input == '') { return ''; } // Output filters are also processed when the input is empty, so check for that.
$tags = explode(',',$input); // Based on a delimiter of comma-space.

// Process them individually
foreach ($tags as $key => $value) {
    $value = ucfirst($value);
    $output[] = $modx->getChunk($tpl,array(
        'tag' => $value
    ));
}

return implode($output);