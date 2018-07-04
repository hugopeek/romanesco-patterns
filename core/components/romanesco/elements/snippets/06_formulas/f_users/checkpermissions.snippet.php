<?php
$pm = array('list' => true);

if ($modx->user->isAuthenticated('kb')) {
    if (!$modx->hasPermission('list')) {
        return 0;
    } else {
        return $modx->user->get('username');
    }
}