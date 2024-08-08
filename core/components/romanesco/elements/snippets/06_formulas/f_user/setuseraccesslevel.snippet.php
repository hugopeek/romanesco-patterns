<?php
/**
 * setUserAccessLevel snippet
 *
 * Check if logged-in user is a regular member, or has admin privileges.
 * The corresponding member groups are set via the member_groups_frontend and
 * admin_groups_frontend system settings.
 *
 * Just to be clear: these are frontend access levels only. They have nothing to
 * do with backend access. Depending on the ACL settings, a user could be admin
 * on frontend, but have no manager privileges at all.
 *
 * @var modX $modx
 * @var array $scriptProperties
 */

$output = $modx->getOption('default', $scriptProperties, 'anonymous');

if (!$modx->getOption('romanesco.set_user_access_level', $scriptProperties)) {
    $output = '';
}
elseif ($modx->user->id) {
    // First, check if user is admin
    $adminGroups = $modx->getOption('romanesco.admin_groups_frontend', $scriptProperties);
    $adminGroups = array_filter(array_map('trim',explode(',',$adminGroups)));
    foreach($adminGroups as $group) {
        if ($modx->user->isMember($group)) {
            $output = 'admin';
        }
    }

    // Next, check regular membership
    if ($output != 'admin') {
        $memberGroups = $modx->getOption('romanesco.member_groups_frontend', $scriptProperties);
        $memberGroups = array_filter(array_map('trim',explode(',',$memberGroups)));
        foreach($memberGroups as $group) {
            if ($modx->user->isMember($group)) {
                $output = 'member';
            }
        }
    }
}

$toPlaceholder = $modx->getOption('toPlaceholder', $scriptProperties, false);
if ($toPlaceholder) {
    $modx->setPlaceholder($toPlaceholder, $output);
    return '';
}
return $output;