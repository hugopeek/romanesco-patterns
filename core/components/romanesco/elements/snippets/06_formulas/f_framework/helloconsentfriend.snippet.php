<?php
/**
 * helloConsentFriend
 *
 * Ask our friend if he's on duty and (optionally) if given service is active.
 * Returns true or false by default, or any output forwarded through the true
 * and false parameters.
 *
 * When true, it means that ConsentFriend should handle rendering of the code
 * snippet. So you can use this in conditionals to prevent these code snippets
 * from being parsed without consent.
 *
 * [[helloConsentFriend?
 *     &service=`youtube`
 *     &true=`You need to give your consent in order to play YouTube videos.`
 *     &false=`[[$videoYoutube? &video=`123`]]`
 * ]]
 *
 * If no service is given, it will only evaluate if the ConsentFriend plugin is
 * active, and return true or false accordingly.
 *
 * @var modX $modx
 * @var array $scriptProperties
 */

$service = $modx->getOption('service', $scriptProperties, '');
$true = $modx->getOption('true', $scriptProperties, true);
$false = $modx->getOption('false', $scriptProperties, false);

// Exit if plugin is not available, or not enabled
$plugin = $modx->getObject('modPlugin', [
    'name' => 'ConsentFriend'
]);
if (!is_object($plugin) || $plugin->get('disabled')) {
    $modx->log(modX::LOG_LEVEL_INFO, 'ConsentFriend not present!');
    return $false;
}

// ConsentFriend is present
$result = true;

// Check if service is active
if ($service) {
    $query = $modx->newQuery('ConsentfriendServices', [
        'name' => $service
    ]);
    $query->select('active');
    $result = (bool)$modx->getValue($query->prepare());
}

// Bye, friend
return $result ? $true : $false;