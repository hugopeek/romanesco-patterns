<?php
/**
 * DEPRECATED
 *
 * Empty TV categories are now automatically hidden in MODX 2.6 and higher.
 */
switch ($modx->event->name) {
    case 'OnManagerPageInit':
        $jsFile = '/assets/js/hide-empty-tv-categories.js';
        $modx->regClientStartupScript($jsFile);
        break;
}
return;