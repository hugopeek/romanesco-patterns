<?php
/*
 * @todo: Not yet working / implemented.
 */
$usr = $modx->getObject('modUser', array('username' => $hook->getValue('username')));
//$usr = $modx->getObject('modUser', $user->get('id'));
$modx->user = &$usr;
$modx->getUser();

$modx->log(modX::LOG_LEVEL_ERROR, '[LACTX] contexts: ' . print_r($modx->user->getSessionContexts()));

$contexts = 'web,hub,kb';
$contexts = explode(',',$contexts);
//foreach ($contexts as $ctx) {
////    if (!$modx->user->hasSessionContext($ctx)) {
////        $modx->user->addSessionContext($ctx);
////    }
//    $modx->user->addSessionContext($ctx);
//}

$modx->user->addSessionContext('hub');

$modx->switchContext('hub');

if ($modx->user->isAuthenticated('hub')) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[LACTX] user is logged in: ' . $modx->user->get('username'));
}


//$modx->log(modX::LOG_LEVEL_ERROR, '[LACTX] user: ' . $modx->user->get('username'));
//$modx->log(modX::LOG_LEVEL_ERROR, '[LACTX] context: ' . $modx->context->get('key'));

return true;