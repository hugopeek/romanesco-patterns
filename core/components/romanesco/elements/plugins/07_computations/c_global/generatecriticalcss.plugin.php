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

$rmCorePath = $modx->getOption('romanescobackyard.core_path', null, $modx->getOption('core_path') . 'components/romanescobackyard/');
$romanesco = $modx->getService('romanesco','Romanesco',$rmCorePath . 'model/romanescobackyard/',array('core_path' => $rmCorePath));

if (!($romanesco instanceof Romanesco)) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[Romanesco] Class not found!');
    return;
}

$basePath = $modx->getOption('base_path');
$cssPath = $modx->getOption('romanesco.custom_css_path');
$distPath = $modx->getOption('romanesco.semantic_dist_path');
$context = $modx->resource->get('context_key');

// Abort if critical is not enabled for current context
if (!$romanesco->getConfigSetting('generate_critical_css', $context)) return;

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
            $logo = $romanesco->getConfigSetting('logo_path', $context);

            // Create array of objects for the header
            $linkObjects = array();
            if (file_exists("$basePath$cssFile")) {
                $linkObjects[] = "</$cssFile>; as=style; rel=preload;";
            }
            if ($logo) {
                $linkObjects[] = "</assets/img/{$logo}>; as=image; rel=preload; nopush";
            }
            $linkObjects[] = "</$distPath/themes/default/assets/fonts/icons.woff2>; as=font; rel=preload; crossorigin; nopush";

            // Set PHP header
            header('Link: ' . implode(',',$linkObjects));
        }

        break;
}