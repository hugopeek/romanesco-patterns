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
 * @var modResource $resource
 * @var $scriptProperties array
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

$cssPath = $romanesco->getCssPath($modx->resource->get('context_key'));
$distPath = $modx->getOption('romanesco.semantic_dist_path');

switch ($modx->event->name) {
    case 'OnDocFormSave':
        $rmCorePath = $modx->getOption('romanescobackyard.core_path', null, $modx->getOption('core_path') . 'components/romanescobackyard/');
        $romanesco = $modx->getService('romanesco','Romanesco',$rmCorePath . 'model/romanescobackyard/',array('core_path' => $rmCorePath));

        if (!($romanesco instanceof Romanesco)) return;

        $romanesco->generateCriticalCSS($id, $resource->get('uri'), $cssPath);

        break;

    case 'OnWebPagePrerender':
        if ($_SERVER['HTTPS'] === 'on') {
            $cssPath = rtrim($cssPath,'/');
            $uri = ltrim($modx->resource->get('uri'),'/');
            $uri = rtrim($modx->resource->get('uri'),'/');
            $logo = $modx->getObject('cgSetting', array('key' => 'logo_path'))->get('value');

            // Create array with header
            $linkObjects = array();
            $linkObjects[] = "</$cssPath/critical/$uri.css>; as=style; rel=preload;";
            $linkObjects[] = "</$distPath/themes/default/assets/fonts/icons.woff2>; as=font; rel=preload; crossorigin; nopush";
            if ($logo) {
                $linkObjects[] = "</assets/img/$logo>; as=image; rel=preload; nopush";
            }

            // Set PHP header
            header('Link: ' . implode(',',$linkObjects));
        }

        break;
}