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

$corePath = $modx->getOption('romanescobackyard.core_path', null, $modx->getOption('core_path') . 'components/romanescobackyard/');
$romanesco = $modx->getService('romanesco','Romanesco',$corePath . 'model/romanescobackyard/', array('core_path' => $corePath));
$corePath = $modx->getOption('scheduler.core_path', null, $modx->getOption('core_path') . 'components/scheduler/');
$scheduler = $modx->getService('scheduler', 'Scheduler', $corePath . 'model/scheduler/');

if (!($romanesco instanceof Romanesco)) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[Romanesco] Class not found!');
    return;
}

// Get CSS path from task properties, snippet properties or input
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
$task->schedule('+1 minutes', [
    'css_path' => $cssPath
]);