<?php
/**
 * getFileContent snippet
 *
 * Load content of provided file. Only accepts file paths relative to project
 * root directory.
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var string $input
 * @var string $options
 */

$path = MODX_BASE_PATH . $modx->getOption('path', $scriptProperties, $input);
if (!file_exists($path)) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[getFileContent] Path not found: ' . $path);
    return '';
}
if (!str_contains(realpath($path), MODX_BASE_PATH)) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[getFileContent] Funky file request: ' . $path);
    return '';
}
return file_get_contents($path);