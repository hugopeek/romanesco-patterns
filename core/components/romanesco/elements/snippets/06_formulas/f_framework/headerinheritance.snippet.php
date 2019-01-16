<?php
// Not implemented yet!!
$title = $modx->getOption('headerTitle', $scriptProperties, '');
$subtitle = $modx->getOption('headerSubtitle', $scriptProperties, '');
$background = $modx->getOption('headerBackground', $scriptProperties, '');
$cta = $modx->getOption('headerCTA', $scriptProperties, '');

echo $cta . '<br>';

if ($cta == 0) {

    echo 'Go ahead with the other header settings <br>';

    if ($title === '@INHERIT') {
        echo 'Header should be inherited <br>';
    } else {
        echo 'Just return the TV value for header <br>';
    }

    if ($subtitle === '@INHERIT') {
        echo 'Subtitle should be inherited <br>';
    } else {
        echo 'Just return the TV value for subtitle <br>';
    }

    if ($background === '@INHERIT') {
        echo 'Background should be inherited <br>';
    } else {
        echo 'Just return the TV value for background <br>';
    }
} else {
    echo 'Return the regular CTA chunk';
}

//$modx->toPlaceholder('container_type', $container_type, $prefix);
//$modx->toPlaceholder('prefix', $prefix);

return '';