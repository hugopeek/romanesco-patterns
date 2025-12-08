<?php
/**
 * returnFirstHit snippet
 *
 * Feed it a bunch of properties, and it spits out the first one that's not empty.
 * Property names are irrelevant. Sort order is all that matters.
 *
 * [[!returnFirstHit?
 *     &1=`[[+redirect_id]]`
 *     &2=`[[+next_step]]`
 *     &3=`[[*fb_redirect_dynamic]]`
 *     &4=`[[*fb_redirect_id]]`
 *     &default=`Nothing there!`
 * ]]
 *
 * @var modX $modx
 * @var array $scriptProperties
 */

$placeholder = $modx->getOption('toPlaceholder', $scriptProperties, false);

// Avoid hitting snippet properties
unset($scriptProperties['toPlaceholder']);
unset($scriptProperties['elementExample']);
unset($scriptProperties['elementStatus']);

$output = '';
foreach ($scriptProperties as $key => $value) {
    if ($value) {
        $output = $value;
        break;
    }
}
if ($placeholder) {
    $modx->setPlaceholder($placeholder, $output);
    return '';
}
return $output;