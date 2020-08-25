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

switch ($modx->event->name) {
    case 'OnDocFormSave':
        $rmCorePath = $modx->getOption('romanescobackyard.core_path', null, $modx->getOption('core_path') . 'components/romanescobackyard/');
        $romanesco = $modx->getService('romanesco','Romanesco',$rmCorePath . 'model/romanescobackyard/',array('core_path' => $rmCorePath));

        if (!($romanesco instanceof Romanesco)) return;

//        if ($resource->getTVValue('header_background_img')) {
//            break;
//        }

        $romanesco->generateCriticalCSS($resource);

        break;

    case 'OnWebPagePrerender':
        if ($_SERVER['HTTPS'] === 'on') {
            $uri = ltrim($modx->resource->get('uri'),'/');
            $uri = rtrim($modx->resource->get('uri'),'/');
            header("Link: </assets/css/critical/{$uri}.css>; as=style; rel=preload;, </assets/img/logo-romanesco.svg>; as=image; rel=preload; nopush, </assets/semantic/dist/themes/default/assets/fonts/icons.woff2>; as=font; rel=preload; crossorigin; nopush");
        }

        break;
}