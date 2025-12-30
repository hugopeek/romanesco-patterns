<?php
/**
 * CacheWarmup
 *
 * Visit all URLs in sitemap to warm up the cache.
 * This plugin creates a scheduler task to run the cacheWarmup snippet in the
 * background.
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var string $input
 *
 * @package romanesco
 */

use MODX\Revolution\modX;
use MODX\Revolution\modResource;

if (!($modx->resource instanceof modResource)) return;

$context = $modx->resource->get('context_key');
$sitemapID = $modx->getOption('romanesco.sitemap_id', $scriptProperties, '');

if (!$sitemapID) return;

switch ($modx->event->name) {
    case 'OnDocFormSave':
        /**
         * @var modResource $resource
         * @var int $id
         * @var Scheduler $scheduler
         */

        // Use Scheduler for adding task to queue
        $schedulerPath = $modx->getOption('scheduler.core_path', null, $modx->getOption('core_path') . 'components/scheduler/');
        $scheduler = $modx->getService('scheduler', 'Scheduler', $schedulerPath . 'model/scheduler/');

        if (!($scheduler instanceof Scheduler)) {
            $modx->log(modX::LOG_LEVEL_ERROR, '[CacheWarmup] Scheduler not found. You\'ll have to do your own warm upping.');
            break;
        }

        // Get or create the warmup task
        $task = $scheduler->getTask('romanesco', 'CacheWarmup');

        if (!($task instanceof sTask)) {
            $task = $modx->newObject('sSnippetTask');
            $task->fromArray(array(
                'class_key' => 'sSnippetTask',
                'content' => 'cacheWarmup',
                'namespace' => 'romanesco',
                'reference' => 'CacheWarmup',
                'description' => 'Batch process page visits to rebuild cache.'
            ));
            if (!$task->save()) {
                $modx->log(modX::LOG_LEVEL_ERROR, '[CacheWarmup] Error saving CacheWarmup task!');
                return;
            }
        }

        // No need to run if task is already pending
        $pendingTasks = $modx->getCollection('sTaskRun', array(
            'task' => $task->get('id'),
            'status' => 0,
            'executedon' => NULL,
        ));
        if (count($pendingTasks) > 0) {
            break;
        }

        // Schedule a new run
        $task->schedule('+0 minutes', [
            'sitemap_url' => $modx->makeUrl($sitemapID, '', '', 'full'),
        ]);
        $modx->log(modX::LOG_LEVEL_INFO, '[CacheWarmup] Scheduled new warmup task.');

        break;
}