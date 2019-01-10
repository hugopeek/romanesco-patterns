<?php
// Get a specific user
$input = $modx->getOption('input', $scriptProperties, '');
$user = $modx->getObject('modUser', $input);

// Get user profile and fail gracefully if user doesn't exist
if ($user) {
    return $user->get('username');
} else {
    return '';
}