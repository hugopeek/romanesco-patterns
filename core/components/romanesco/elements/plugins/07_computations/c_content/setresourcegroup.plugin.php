<?php
/*
 * setResourceGroup
 *
 * Add resource to a specific group, based on certain conditions or variables.
 */

$resourceGroup = $modx->getObject('modResourceGroup',1);
$resourceGroupName = $resourceGroup->get('name');

if (!is_object($resourceGroup)) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[setResourceGroup] Resource group not found.');
    return false;
}

switch ($modx->event->name) {
    case 'OnDocFormSave':

        // Tickets
        if ($resource->get('class_key','Ticket')) {

            // If resource is a private ticket, add it to the KB private resource group
            if ($resource->get('privateweb') && !$resource->isMember($resourceGroupName)) {
                $resource->joinGroup(1);
                $modx->log(modX::LOG_LEVEL_INFO, '[setResourceGroup] Resource "' . $resource->get('pagetitle') . '" joined resource group: ' . $resourceGroupName);
            }

            // If the ticket is not private, remove it from the resource group
            if (!$resource->get('privateweb') && $resource->isMember($resourceGroup->get('name'))) {
                $resource->leaveGroup(1);
                $modx->log(modX::LOG_LEVEL_INFO, '[setResourceGroup] Resource "' . $resource->get('pagetitle') . '" left resource group: ' . $resourceGroupName);
            }
        }

        break;
}