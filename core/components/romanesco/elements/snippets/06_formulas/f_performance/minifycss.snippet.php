<?php
/**
 * MinifyCSS snippet
 *
 * Generate minified version of given CSS file.
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var object $task
 * @var string $input
 * @var Scheduler $scheduler
 *
 */

use MODX\Revolution\modX;
use FractalFarming\Romanesco\Romanesco;
use Psr\Container\NotFoundExceptionInterface;

/** @var Romanesco $romanesco */
try {
    $romanesco = $modx->services->get('romanesco');
} catch (NotFoundExceptionInterface $e) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[Romanesco3x] ' . $e->getMessage());
}

$corePath = $modx->getOption('scheduler.core_path', null, $modx->getOption('core_path') . 'components/scheduler/');
$scheduler = $modx->getService('scheduler', 'Scheduler', $corePath . 'model/scheduler/');

// Get CSS path from task properties, snippet properties or input
$input = $modx->getOption('input', $scriptProperties, $input) ?? null;
$cssPath = $modx->getOption('css_path', $scriptProperties, $input);

// Generate CSS directly if snippet is run as scheduled task, or if Scheduler is not installed
if (!($scheduler instanceof Scheduler) || is_object($task)) {
    $romanesco->minifyCSS($cssPath);
    return;
}

// From here on, we're scheduling a task
$task = $scheduler->getTask('romanesco', 'MinifyCSS');

// Create task first if it doesn't exist
if (!($task instanceof sTask)) {
    $task = $modx->newObject('sSnippetTask');
    $task->fromArray([
        'class_key' => 'sSnippetTask',
        'content' => 'minifyCSS',
        'namespace' => 'romanesco',
        'reference' => 'MinifyCSS',
        'description' => 'Generate minified version of given CSS file.'
    ]);
    if (!$task->save()) {
        return 'Error saving MinifyCSS task';
    }
}

// Check if task is not already scheduled
$pendingTasks = $modx->getCollection('sTaskRun', [
    'task' => $task->get('id'),
    'status' => 0,
    'executedon' => NULL,
]);
foreach ($pendingTasks as $pendingTask) {
    $data = $pendingTask->get('data');
    if (isset($data['css_path']) && $data['css_path'] == $cssPath) {
        return;
    }
}

// Schedule a new run
$task->schedule('+0 minutes', [
    'css_path' => $cssPath
]);