<?php
/**
 * fbValidateTurnstile
 *
 * Server side validation of Turnstile token.
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var FormIt $formit
 * @var fiHooks $hook
 *
 * @package romanesco
 */

use MODX\Revolution\modX;

$secret = $modx->getOption('formblocks.turnstile_secret_key', $scriptProperties, '');
$token = $hook->getValue('cf-turnstile-response') ?? $_POST['cf-turnstile-response'];
$remoteip = $_SERVER['HTTP_CF_CONNECTING_IP'] ??
    $_SERVER['HTTP_X_FORWARDED_FOR'] ??
    $_SERVER['REMOTE_ADDR'];

$url = 'https://challenges.cloudflare.com/turnstile/v0/siteverify';
$data = [
    'secret' => $secret,
    'response' => $token
];

if ($remoteip) {
    $data['remoteip'] = $remoteip;
}

$options = [
    'http' => [
        'header' => "Content-type: application/x-www-form-urlencoded\r\n",
        'method' => 'POST',
        'content' => http_build_query($data)
    ]
];

$context = stream_context_create($options);
$response = file_get_contents($url, false, $context);

if (!$response) {
    $response = ['success' => false, 'error-codes' => ['internal-error']];
} else {
    $response = json_decode($response, true);
}

if (isset($response['success']) && !$response['success']) {
    $errors = implode(', ', $response['error-codes']);
    $modx->log(modX::LOG_LEVEL_ERROR, "Turnstile failed to validate: $errors");
    $hook->addError('turnstile', "Cloudflare failed to validate: $errors.");
    return false;
}

return true;