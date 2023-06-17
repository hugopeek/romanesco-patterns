<?php
/**
 * setUserPlaceholders
 *
 * @var modX $modx
 * @var array $scriptProperties
 */

$userId = $modx->getOption('userId', $scriptProperties, '');

// Get a specific user
$user = $modx->getObject('modUser', $userId);

// Get user profile and fail gracefully if user doesn't exist
if ($user) {
    $profile = $user->getOne('Profile');
} else {
    $modx->log(modX::LOG_LEVEL_WARN, '[setUserPlaceholders] User not found in MODX');
    return '';
}

// Get extended fields of this user
if ($profile) {
    $extended = $profile->get('extended');
    $modx->toPlaceholders($extended, '');
} else {
    $modx->log(modX::LOG_LEVEL_ERROR, '[setUserPlaceholders] Could not find profile for user: ' . $user->get('username'));
}

return '';