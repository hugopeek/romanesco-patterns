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
if (!$romanesco->getConfigSetting('critical_css', $context)) return;

switch ($modx->event->name) {
    case 'OnDocFormSave':
        /**
         * @var modResource $resource
         * @var int $id
         */

        $globalTemplates = [8,9,10,11,19,27];
        $excludedTemplates = explode(',', $romanesco->getConfigSetting('critical_exclude_templates', $context));
        $excludedTemplates = array_merge($globalTemplates, $excludedTemplates);
        $sharedTemplates = explode(',', $romanesco->getConfigSetting('critical_shared_templates', $context));

        $template = $modx->getObject('modTemplate', array('id' => $resource->get('template')));
        $uri = ltrim($resource->get('uri'),'/');
        $uri = rtrim($uri,'/');
        $criticalPath = rtrim($cssPath,'/') . '/critical/';

        // Empty and excluded templates
        if (in_array($resource->get('template'), $excludedTemplates) || !is_object($template)) {
            $resource->setTVValue('critical_css_uri', '');
            break;
        }

        // Templates with shared CSS
        if (in_array($resource->get('template'), $sharedTemplates)) {
            $uri = strtolower($template->get('templatename'));
            $uri = str_replace(' ', '', $uri);
        }

        // Store full path to css file in a TV
        $resource->setTVValue('critical_css_uri', $criticalPath . $uri . '.css');

        $romanesco->generateCriticalCSS(array(
            'id' => $id,
            'uri' => $uri,
            'cssPath' => $cssPath,
            'distPath' => $distPath,
        ));

        break;

    case 'OnWebPagePrerender':
        if ($_SERVER['HTTPS'] === 'on') {
            $cssFile = $modx->resource->getTVValue('critical_css_uri');
            $logo = $romanesco->getConfigSetting('logo_path', $context);

            // Create array of objects for the header
            $linkObjects = array();
            if ($cssFile && file_exists($basePath . $cssFile)) {
                $linkObjects[] = "</{$cssFile}>; as=style; rel=preload;";
            }
            if ($logo) {
                $linkObjects[] = "</assets/img/{$logo}>; as=image; rel=preload; nopush";
            }
            $linkObjects[] = "</{$distPath}/themes/default/assets/fonts/icons.woff2>; as=font; rel=preload; crossorigin; nopush";

            // Set PHP header
            header('Link: ' . implode(',',$linkObjects));
        }

        break;
}