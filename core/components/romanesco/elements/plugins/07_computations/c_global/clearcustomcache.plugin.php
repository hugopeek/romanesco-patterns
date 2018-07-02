<?php
/*
 * Clear custom cache partitions.
 */

switch ($modx->event->name) {
    case 'OnSiteRefresh':
    case 'OnDocFormSave':

        if ($modx->getOption('romanesco.member_groups')) {
            $partitions = 'nav_anonymous,nav_member';
            $response = $modx->runProcessor('cache/partition/refresh', array(
                'partitions' => $partitions
            ), array(
                'processors_path' => MODX_CORE_PATH . 'components/getcache/processors/'
            ));

            if ($response->isError()) {
                $modx->log(modX::LOG_LEVEL_ERROR, 'There was an error refreshing (one of) your custom cache partitions. ' . $response->getMessage(), '', 'Cache Refresh');
            } else {
                //$oldLoglevel = $modx->getLogLevel();
                //$modx->setLogLevel(modX::LOG_LEVEL_INFO);
                $modx->log(modX::LOG_LEVEL_INFO, 'Cache partitions successfully cleared.', '', 'Cache Refresh');
                //$modx->setLogLevel($oldLoglevel);
            }
            break;
        }
}
return;