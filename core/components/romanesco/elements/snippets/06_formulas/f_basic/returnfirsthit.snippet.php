<?php
/**
 * returnFirstHit snippet
 *
 * Feed it a bunch of properties and it spits out the first one that's not empty.
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
 * @var array $scriptProperties
 */

// Avoid hitting snippet properties
unset($scriptProperties['elementExample']);
unset($scriptProperties['elementStatus']);

foreach ($scriptProperties as $key => $value) {
    if ($value) return $value;
}
return '';
