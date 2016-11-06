<?php
switch ($modx->event->name) {
    case 'OnManagerPageInit':
        $jsFile = '/assets/js/hide-empty-tv-categories.js';
        $modx->regClientStartupScript($jsFile);
        break;
}
return;