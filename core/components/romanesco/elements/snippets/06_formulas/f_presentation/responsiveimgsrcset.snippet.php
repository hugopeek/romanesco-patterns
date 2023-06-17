<?php
/**
 * responsiveImgSrcset
 *
 * Generates a number of srcset properties, for use inside an <img> tag.
 *
 * The dimensions for each srcset image are defined inside the
 * img_breakpoints configuration setting.
 *
 * @var modX $modx
 * @var array $scriptProperties
 */

$breakpoints = $modx->getOption('breakpoints', $scriptProperties, '');
$src = $modx->getOption('src', $scriptProperties, '');
$crop = $modx->getOption('crop', $scriptProperties, '');
$width = $modx->getOption('width', $scriptProperties, '');
$quality = $modx->getOption('quality', $scriptProperties, '');
$tpl = $modx->getOption('tpl', $scriptProperties, 'imgResponsiveRowSrcset');
$prefix = $modx->getOption('prefix', $scriptProperties, '');
$placeholder = $modx->getOption('toPlaceholder', $scriptProperties, '');

// Output filters are also processed when the input is empty, so check for that.
if ($breakpoints == '') { return ''; }

$breakpoints = explode(',', $breakpoints);
$output = array();

// Process each breakpoint individually
foreach ($breakpoints as $key => $value) {
    $output[] = $modx->getChunk($tpl, array(
        'src' => $src,
        'crop' => $crop,
        'width' => $width,
        'breakpoint' => $value,
        'quality' => $quality
    ));
}

$output = implode(",\n", $output);

if ($placeholder) {
    $modx->toPlaceholder($placeholder, $output, $prefix);
    return '';
} else {
    return $output;
}