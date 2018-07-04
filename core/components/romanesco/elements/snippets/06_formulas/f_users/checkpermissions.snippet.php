<?php
$context = $modx->getOption('context', $scriptProperties, $modx->context->get('key'));
$redirectTo = $modx->getOption('redirectTo', $scriptProperties, null);

// If a context is specified, make sure we're in it
if ($context !== $modx->context->get('key')) {
    return '';
}

// Exclude the unauthorized page from any redirects
if ($modx->resource->get('id') == $modx->getOption('unauthorized_page')) {
    return '';
}

if (!$modx->user->hasSessionContext($context)) {
    if (!empty($redirectTo)) {
        $redirectParams = !empty($redirectParams) ? $modx->fromJSON($redirectParams) : '';
        $url = $modx->makeUrl($redirectTo,'',$redirectParams,'full');
        $modx->sendRedirect($url);
    } else {
        $modx->sendUnauthorizedPage();
    }
}

return '';