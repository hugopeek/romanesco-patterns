<?php
/**
 * CacheWarmup
 *
 * Visit all URLs in sitemap to warm up the cache.
 * 
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
$concurrency = $modx->getOption('romanesco.cache_warmup_concurrency', $scriptProperties, 1);
$delay = $modx->getOption('romanesco.cache_warmup_delay', $scriptProperties, 0);

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

        // Look for existing warmup task
        $task = $scheduler->getTask('romanesco', 'CacheWarmup');
        $taskData = [
            'sitemap_url' => $modx->makeUrl($sitemapID, '', '', 'full'),
            'concurrency' => $concurrency,
        ];

        // Check if existing task is currently running (status 1)
        $runningTask = false;
        if ($task instanceof sTask) {
            $runningTask = (bool) $modx->getObject('sTaskRun', [
                'task' => $task->get('id'),
                'status' => 1,
                'executedon' => NULL,
            ]);
        }

        // Create new task if none exists or current one is already running
        if (!($task instanceof sTask) || $runningTask) {
            $task = $modx->newObject('sSnippetTask');
            $task->fromArray([
                'class_key' => 'sSnippetTask',
                'content' => 'cacheWarmup',
                'namespace' => 'romanesco',
                'reference' => 'CacheWarmup',
                'description' => 'Batch process page visits to rebuild cache.'
            ]);
            if (!$task->save()) {
                $modx->log(modX::LOG_LEVEL_ERROR, '[CacheWarmup] Error saving CacheWarmup task!');
                break;
            }
        }

        // Update if task is already pending
        $pendingTasks = $modx->getCollection('sTaskRun', [
            'task' => $task->get('id'),
            'status' => 0,
            'executedon' => NULL,
        ]);
        if ($pendingTasks) {
            // Update first pending run with new timing and data
            $run = reset($pendingTasks);
            $run->setTiming('+' . $delay . ' minutes');
            $run->set('data', $taskData);
            $run->save();

            // Remove any extra duplicate pending runs
            $first = true;
            foreach ($pendingTasks as $run) {
                if ($first) { $first = false; continue; }
                $run->remove();
            }

            $modx->log(modX::LOG_LEVEL_INFO, '[CacheWarmup] Rescheduled existing warmup task.');
            break;
        }

        // Schedule a new run
        $task->schedule('+' . $delay . ' minutes', $taskData);
        $modx->log(modX::LOG_LEVEL_INFO, '[CacheWarmup] Scheduled new warmup task.');

        break;
}