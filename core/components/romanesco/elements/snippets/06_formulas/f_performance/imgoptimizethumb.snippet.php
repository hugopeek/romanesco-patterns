<?php
/**
 * imgOptimizeThumb
 *
 * Post hook for pThumb, that runs after the thumbnail is generated.
 *
 * It uses the Squoosh library from Google to create a WebP version of the image
 * and optimize the original. You need to install the Squoosh CLI package on
 * your server with NPM: 'npm install -g @squoosh/cli'
 *
 * If the Scheduler extra is installed, the Squoosh command is added there as an
 * individual task. This means it takes a little while for all the images to be
 * generated. Without Scheduler they're created when the page is requested,
 * but the initial request will take a lot longer (the thumbnails are
 * also being generated here).
 *
 * To serve the WebP images in the browser, use Nginx to intercept the image
 * request and redirect it to the WebP version. It will do so by setting a
 * different header with the correct mime type, but only if the WebP
 * image is available (and if the browser supports it). So you don't need to
 * change the image paths in MODX or provide any fallbacks in HTML.
 *
 * This guide perfectly explains this little trick:
 * https://alexey.detr.us/en/posts/2018/2018-08-20-webp-nginx-with-fallback/
 *
 * IMPORTANT NOTE: the post hook is not a standard feature of pThumb yet, so
 * you'll need to overwrite the core class yourself. A PR is in the making.
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var object $task
 */

$basePath = $modx->getOption('base_path', $scriptProperties, '');
$corePath = $modx->getOption('romanescobackyard.core_path', null, $modx->getOption('core_path') . 'components/romanescobackyard/');
$romanesco = $modx->getService('romanesco','Romanesco',$corePath . 'model/romanescobackyard/',array('core_path' => $corePath));

if (!($romanesco instanceof Romanesco)) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[Romanesco] Class not found!');
    return;
}

// Get image path from task properties or pThumb properties
$imgPath = $modx->getOption('img_path', $scriptProperties, $scriptProperties['file']);
$outputDir = dirname($imgPath);

// Look for context key
$context = $modx->getOption('context', $scriptProperties, '');
if (!$context) {
    $context = $modx->resource->get('context_key');
}

// Get image quality setting for corresponding context
$imgQuality = (int) $romanesco->getConfigSetting('img_quality', $context) ?? 65;

$configWebP = json_encode([
    "quality" => $imgQuality,
    "target_size" => 0,
    "target_PSNR" => 0,
    "method" => 4,
    "sns_strength" => 50,
    "filter_strength" => 60,
    "filter_sharpness" => 0,
    "filter_type" => 1,
    "partitions" => 0,
    "segments" => 4,
    "pass" => 1,
    "show_compressed" => 0,
    "preprocessing" => 0,
    "autofilter" => 0,
    "partition_limit" => 0,
    "alpha_compression" => 1,
    "alpha_filtering" => 1,
    "alpha_quality" => 100,
    "lossless" => 0,
    "exact" => 0,
    "image_hint" => 0,
    "emulate_jpeg_size" => 0,
    "thread_level" => 0,
    "low_memory" => 0,
    "near_lossless" => 100,
    "use_delta_palette" => 0,
    "use_sharp_yuv" => 0
]);

$configJPG = json_encode([
    "quality" => $imgQuality,
    "baseline" => false,
    "arithmetic" => false,
    "progressive" => true,
    "optimize_coding" => true,
    "smoothing" => 0,
    "color_space" => 3,
    "quant_table" => 3,
    "trellis_multipass" => false,
    "trellis_opt_zero" => false,
    "trellis_opt_table" => false,
    "trellis_loops" => 1,
    "auto_subsample" => true,
    "chroma_subsample" => 2,
    "separate_chroma_quality" => false,
    "chroma_quality" => 75
]);

// Use Scheduler for adding task to queue (if available)
/** @var Scheduler $scheduler */
$schedulerPath = $modx->getOption('scheduler.core_path', null, $modx->getOption('core_path') . 'components/scheduler/');
$scheduler = $modx->getService('scheduler', 'Scheduler', $schedulerPath . 'model/scheduler/');

// Generate CSS directly if snippet is run as scheduled task, or if Scheduler is not installed
if (!($scheduler instanceof Scheduler) || is_object($task)) {
    exec('"$HOME"/.nvm/nvm-exec squoosh-cli' .
        ' --webp ' . escapeshellarg($configWebP) .
        ' --mozjpeg ' . escapeshellarg($configJPG) .
        ' --output-dir ' . escapeshellarg($outputDir) . ' ' . escapeshellarg($imgPath) .
        ' 2>&1',
        $output,
        $return_img
    );

    // Write output to file and error log
    $logFile = escapeshellcmd($modx->getOption('core_path')) . 'cache/logs/img.log';
    $date = new DateTime();
    $output = implode("\n",$output) . "\n";

    file_put_contents($logFile, "[" . $date->format("Y-m-d H:i:s") . "] " . $output, FILE_APPEND);
    $modx->log(modX::LOG_LEVEL_INFO, "\n" . $output);

    return;
}

// From here on, we're scheduling a task
$task = $scheduler->getTask('romanesco', 'ImgOptimizeThumb');

// Create task first if it doesn't exist
if (!($task instanceof sTask)) {
    $task = $modx->newObject('sSnippetTask');
    $task->fromArray(array(
        'class_key' => 'sSnippetTask',
        'content' => 'imgOptimizeThumb',
        'namespace' => 'romanesco',
        'reference' => 'ImgOptimizeThumb',
        'description' => 'Create WebP version and reduce file size of thumbnail image.'
    ));
    if (!$task->save()) {
        return 'Error saving ImgOptimizeThumb task';
    }
}

// Check if task is not already scheduled
$pendingTasks = $modx->getCollection('sTaskRun', array(
    'task' => $task->get('id'),
    'status' => 0,
    'executedon' => NULL,
));
foreach ($pendingTasks as $pendingTask) {
    $data = $pendingTask->get('data');
    if ($data['img_path'] == $imgPath) {
        return true;
    }
}

// Schedule a new run
$task->schedule('+1 minutes', array(
    'img_path' => $imgPath,
    'context' => $context,
));

return;