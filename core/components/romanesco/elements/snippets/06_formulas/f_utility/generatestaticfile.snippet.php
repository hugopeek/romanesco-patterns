<?php
/**
 * generateStaticFile
 *
 * Create a physical HTML file of a resource in the designated location.
 *
 * Usage: this is a utility snippet. Place it in the content somewhere and visit
 * that page in the browser to generate the file.
 *
 * NB! Won't work if the snippet is on the page you want to export!
 *
 * @var modX $modx
 * @var $scriptProperties array
 *
 * @package romanesco
 *
 * @todo: convert to plugin, support multiple files, add ability to change site_url.
 */

$file = $modx->getOption('file', $scriptProperties, '');
$resourceID = $modx->getOption('id', $scriptProperties, '');

$pathInfo = pathinfo($file);
$path = $pathInfo['dirname'];

if (!file_exists($path)) {
    mkdir($path, 0755, true);
}

if ($file) {
    // The resource needs to be processed by MODX first.
    // The easiest way to get the result is through the browser.
    $content = file_get_contents($modx->makeUrl($resourceID,'','','full')) . PHP_EOL;

    file_put_contents($file, $content);
}

return 'Done.';