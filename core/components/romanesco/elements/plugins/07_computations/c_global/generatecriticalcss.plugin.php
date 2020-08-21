<?php
/**
 * GenerateCriticalCSS
 *
 *
 * @var modX $modx
 * @var modResource $resource
 * @var $scriptProperties array
 *
 * @package romanesco
 */

switch ($modx->event->name) {
    case 'OnDocFormSave':

//        if ($resource->getTVValue('header_background_img')) {
//            break;
//        }

        // Get default CSS path
        $cssPathSystem = $modx->getObject('modSystemSetting', array('key' => 'romanesco.custom_css_path'));
        if ($cssPathSystem) {
            $cssPathDefault = $modx->getOption('base_path') . $cssPathSystem->get('value');
        } else {
            $cssPathDefault = $modx->getOption('base_path') . 'assets/css';
        }

        // Get context CSS path
        $cssPathContext = $modx->getObject('modContextSetting', array(
            'context_key' => $resource->get('context_key'),
            'key' => 'romanesco.custom_css_path'
        ));

        $buildCommand = 'gulp critical --src ' . $modx->makeUrl($resource->get('id'),'','','full') . ' --dist ' . $cssPathDefault . '/critical/'. rtrim($resource->get('uri'),'/') . '.css';

        exec(
            '"$HOME/.nvm/nvm-exec" ' . $buildCommand .
            ' --gulpfile ' . escapeshellcmd($modx->getOption('assets_path')) . 'components/romanescobackyard/js/gulp/generate-critical-css.js' .
            ' >> ' . escapeshellcmd($modx->getOption('core_path')) . 'cache/logs/css-critical.log' .
            ' 2>>' . escapeshellcmd($modx->getOption('core_path')) . 'cache/logs/css-error.log &',
            $output,
            $return_css
        );

        break;

    case 'OnWebPagePrerender':
        if ($_SERVER['HTTPS'] === 'on') {
            $uri = ltrim($modx->resource->get('uri'),'/');
            $uri = rtrim($modx->resource->get('uri'),'/');
            header("Link: </assets/css/critical/{$uri}.css>; as=style; rel=preload;, </assets/img/logo-romanesco.svg>; as=image; rel=preload; nopush, </assets/semantic/dist/themes/default/assets/fonts/icons.woff2>; as=font; rel=preload; crossorigin; nopush");
        }

        break;
}