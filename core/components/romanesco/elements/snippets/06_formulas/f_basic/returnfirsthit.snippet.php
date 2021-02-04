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

foreach ($scriptProperties as $key => $value) {
    if ($key == 'elementExample' || $key == 'elementStatus') continue; // skip snippet properties
    if ($value) return $value;
}
return '';
