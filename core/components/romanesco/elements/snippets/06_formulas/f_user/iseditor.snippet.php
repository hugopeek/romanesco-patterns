<?php
/**
 * isEditor snippet
 *
 * Check if user is logged in to the manager.
 *
 * @author Mark Hamstra
 *
 * @var modX $modx
 */

if ($modx->user instanceof MODX\Revolution\modUser) {
    if ($modx->user->hasSessionContext('mgr')) {
        return true;
    }
}
return false;