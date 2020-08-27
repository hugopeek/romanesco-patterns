<?php
/**
 * GenerateCriticalCSS
 *
 * Determine which CSS styles are used above the fold and write them to a custom
 * CSS file. This needs NPM and the critical package to be installed.
 *
 * https://github.com/addyosmani/critical
 *
 * @var modX $modx
 * @var array $scriptProperties
 *
 * @package romanesco
 */

// Abort if critical CSS generation is not enabled under Configuration settings
if ($modx->getObject('cgSetting', array('key' => 'generate_critical_css'))->get('value') != 1) {
    return true;
}

$rmCorePath = $modx->getOption('romanescobackyard.core_path', null, $modx->getOption('core_path') . 'components/romanescobackyard/');
$romanesco = $modx->getService('romanesco','Romanesco',$rmCorePath . 'model/romanescobackyard/',array('core_path' => $rmCorePath));

if (!($romanesco instanceof Romanesco)) {
    $modx->log(modX::LOG_LEVEL_ERROR, 'Class not found!');
    return true;
}

$basePath = $modx->getOption('base_path');
$cssPath = $romanesco->getCssPath($modx->resource->get('context_key'));
$distPath = $modx->getOption('romanesco.semantic_dist_path');

switch ($modx->event->name) {
    case 'OnDocFormSave':
        /**
         * @var modResource $resource
         * @var int $id
         */

        $romanesco->generateCriticalCSS($id, $resource->get('uri'), $cssPath);

        break;

    case 'OnWebPagePrerender':
        if ($_SERVER['HTTPS'] === 'on') {
            $uri = ltrim($modx->resource->get('uri'),'/');
            $uri = rtrim($modx->resource->get('uri'),'/');
            $cssFile = rtrim($cssPath,'/') . "/critical/$uri.css";
            $logo = $modx->getObject('cgSetting', array('key' => 'logo_path'));

            // Create array with objects for the header
            $linkObjects = array();
            if (file_exists("$basePath$cssFile")) {
                $linkObjects[] = "</$cssFile>; as=style; rel=preload;";
            }
            if ($logo) {
                $linkObjects[] = "</assets/img/{$logo->get('value')}>; as=image; rel=preload; nopush";
            }
            $linkObjects[] = "</$distPath/themes/default/assets/fonts/icons.woff2>; as=font; rel=preload; crossorigin; nopush";

            // Set PHP header
            header('Link: ' . implode(',',$linkObjects));
        }

        break;
}