<?php
// Get a specific user
$id = $modx->getOption('id', $scriptProperties, $input);
$user = $modx->getObject('modUser', $id);

// Get user profile and fail gracefully if user doesn't exist
if ($user) {
    return $user->get('username');
} else {
    return '';
}