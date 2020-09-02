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

$context = $modx->resource->get('context_key');
$cgSetting = $modx->getObject('cgSetting', array('key' => 'generate_critical_css'));

// Check if critical CSS generation is enabled under Configuration settings
if (is_object($cgSetting) && $modx->getOption('clientconfig.context_aware') == true) {
    $cgContextValue = $modx->getObject('cgContextValue', array('setting' => 79, 'context' => $context));

    if (is_object($cgContextValue)) {
        $critical = $cgContextValue->get('value');
    } else {
        $critical = $cgSetting->get('value');
    }
}
elseif (is_object($cgSetting)) {
    $critical = $cgSetting->get('value');
}
else {
    $modx->log(modX::LOG_LEVEL_ERROR, 'Context setting generate_critical_css not found!');
    return;
}

// Abort if critical is not enabled for current context
if (!$critical) return;


$rmCorePath = $modx->getOption('romanescobackyard.core_path', null, $modx->getOption('core_path') . 'components/romanescobackyard/');
$romanesco = $modx->getService('romanesco','Romanesco',$rmCorePath . 'model/romanescobackyard/',array('core_path' => $rmCorePath));
$basePath = $modx->getOption('base_path');
$cssPath = $modx->getOption('romanesco.custom_css_path');
$distPath = $modx->getOption('romanesco.semantic_dist_path');

if (!($romanesco instanceof Romanesco)) {
    $modx->log(modX::LOG_LEVEL_ERROR, 'Romanesco class not found!');
    return;
}

switch ($modx->event->name) {
    case 'OnDocFormSave':
        /**
         * @var modResource $resource
         * @var int $id
         */

        $romanesco->generateCriticalCSS(array(
            'id' => $id,
            'uri' => $resource->get('uri'),
            'cssPath' => $cssPath,
            'distPath' => $distPath,
        ));

        break;

    case 'OnWebPagePrerender':
        if ($_SERVER['HTTPS'] === 'on') {
            $uri = ltrim($modx->resource->get('uri'),'/');
            $uri = rtrim($modx->resource->get('uri'),'/');
            $cssFile = rtrim($cssPath,'/') . "/critical/$uri.css";
            $logo = $modx->getObject('cgSetting', array('key' => 'logo_path'));

            // Create array of objects for the header
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