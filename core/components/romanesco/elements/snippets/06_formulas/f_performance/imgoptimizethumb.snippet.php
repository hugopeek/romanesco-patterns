<?php
/**
 * imgOptimizeThumb
 *
 * Output modifier for pThumb, to further optimize the generated thumbnail.
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
 * @var modX $modx
 * @var array $scriptProperties
 * @var object $task
 * @var string $input
 * @var string $options
 */

$corePath = $modx->getOption('romanescobackyard.core_path', null, $modx->getOption('core_path') . 'components/romanescobackyard/');
$romanesco = $modx->getService('romanesco','Romanesco',$corePath . 'model/romanescobackyard/',array('core_path' => $corePath));

if (!($romanesco instanceof Romanesco)) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[Romanesco] Class not found!');
    return;
}

use Jcupitt\Vips;

// Get image path from task properties, pThumb properties or input
$imgPath = $modx->getOption('img_path', $scriptProperties, $input ?? null);
$imgPathFull = str_replace('//','/', MODX_BASE_PATH . $imgPath);
$imgName = pathinfo($imgPathFull, PATHINFO_FILENAME);
$imgType = pathinfo($imgPathFull, PATHINFO_EXTENSION);
$outputDir = dirname($imgPathFull);

// Check if path or file exist
if (!$imgPath || !file_exists($imgPathFull)) {
    $modx->log(modX::LOG_LEVEL_WARN, '[imgOptimizeThumb] Image not found: ' . $imgPathFull);
    return $imgPath;
}

// Look for resource context key
$context = $modx->getOption('context', $scriptProperties, '');
if (is_object($modx->resource) && !$context) {
    $context = $modx->resource->get('context_key');
}

// Abort if optimization is disabled for this context
if (!$romanesco->getConfigSetting('img_optimize', $context)) {
    return $imgPath;
}

// Abort if file format is not supported
if ($imgType == 'svg') {
    return $imgPath;
}

// And if WebP version is already created
if (file_exists($outputDir . '/' . $imgName . '.webp')) {
    return $imgPath;
}

// Get image quality from task properties, output modifier option or corresponding context setting
$imgQuality = $modx->getOption('img_quality', $scriptProperties, $options ?? null);
if (!$imgQuality) {
    $imgQuality = $romanesco->getConfigSetting('img_quality', $context);
}
$imgQuality = (int) $imgQuality;

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

$configPNG = json_encode([
    "level" => 2,
    "interlace" => false
]);

// Use different compression engine for JPG and PNG
$squooshOption = '';
if (strtolower($imgType) == 'png') {
    $squooshType = '--oxipng';
    $squooshConfig = $configPNG;
} else {
    $squooshOption = '--mozjpeg';
    $squooshConfig = $configJPG;
}

// Use Scheduler for adding task to queue (if available)
/** @var Scheduler $scheduler */
$schedulerPath = $modx->getOption('scheduler.core_path', null, $modx->getOption('core_path') . 'components/scheduler/');
$scheduler = $modx->getService('scheduler', 'Scheduler', $schedulerPath . 'model/scheduler/');

// load an image, get fields, process, save
try {
    $image = Vips\Image::newFromFile($imgPathFull);
    $modx->log(modX::LOG_LEVEL_ERROR, '[Vips] path: ' . $imgPathFull);
    $modx->log(modX::LOG_LEVEL_ERROR, '[Vips] width: ' . $image->width);
}
catch (Vips\Exception $e) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[Vips] ' . $e->getMessage());
    return;
}

$image->webpsave($imgName, ['Q' => $imgQuality]);

try {
    $image->writeToFile("$outputDir/$imgName.webp");
    $modx->log(modX::LOG_LEVEL_ERROR, '[Vips] writing to: ' . "$outputDir/$imgName.webp");
}
catch (Vips\Exception $e) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[Vips] ' . $e->getMessage());
    return;
}



return;

// Generate CSS directly if snippet is run as scheduled task, or if Scheduler is not installed
if (!($scheduler instanceof Scheduler) || is_object($task)) {

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
    if ($data['img_path'] == $imgPath && $data['img_quality'] == $imgQuality) {
        return;
    }
}

// Schedule a new run
$task->schedule('+1 minutes', array(
    'img_path' => $imgPath,
    'img_quality' => $imgQuality,
    'context' => $context,
));

return $imgPath;