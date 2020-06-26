<?php
/**
 * generateStaticCSS
 *
 * Creates static CSS files for each context, with their own global backgrounds.
 *
 * If you want a context to have its own set of backgrounds, you need to create
 * a child page under the Global Backgrounds container for it. Make sure the
 * template is GlobalBackgrounds too and that the alias matches the context_key!
 *
 * A default stylesheet (site.css) is also generated, containing only the
 * backgrounds at root level of the Global Backgrounds container.
 *
 * CSS files are regenerated each time a GlobalBackgrounds resource is saved.
 *
 * NB! The plugin priority should be set to something higher than 0. Otherwise,
 * users will need to save the resource twice to see their changes reflected.
 */

switch ($modx->event->name) {
    case 'OnDocFormSave':
        $exit = '';

        // Exit if resource template is not GlobalBackground(s)
        $templateID = $resource->get('template');
        if ($templateID != 27 && $templateID != 8) {
            $exit = 1;
        }

        // But continue if a header background is being set
        if ($resource->getTVValue('header_background_img')) {
            $exit = 0;
        }

        // Leave the EU?
        if ($exit) return true;

        // Get all background containers
        $bgContainers = $modx->getCollection('modResource', array(
            'parent' => $modx->getOption('romanesco.global_backgrounds_id'),
            'template' => 8
        ));

        // Get chunk with CSS template
        if ($modx->getObject('modChunk', array('name' => 'cssTheme'))) {
            $cssChunk = 'cssTheme';
        } else {
            $cssChunk = 'css';
        }

        // Get default CSS path
        $cssPathDefault = $modx->getObject('modSystemSetting', array('key' => 'romanesco.custom_css_path'));
        if ($cssPathDefault) {
            $cssPath = $modx->getOption('base_path') . $cssPathDefault->get('value');
        } else {
            $cssPath = $modx->getOption('base_path') . 'assets/css';
        }

        // Generate default CSS file
        $css = $modx->getChunk($cssChunk);
        $staticFile = $cssPath . '/site.css';

        if (!$modx->cacheManager->writeFile($staticFile, $css)) {
            $modx->log(modX::LOG_LEVEL_ERROR, "Error caching output from Resource {$modx->resource->get('id')} to static file {$staticFile}", '', __FUNCTION__, __FILE__, __LINE__);
        }

        // Start collecting CSS paths for minification down the road
        $minifyCSS[] = $cssPath;

        // Each container represents a context
        foreach ($bgContainers as $container) {
            $context = $container->get('alias');

            // Generate CSS for this context
            $css = $modx->getChunk($cssChunk, array(
                'context' => $context,
            ));

            // Look for custom path in context settings
            $cssPathContext = $modx->getObject('modContextSetting', array(
                'context_key' => $context,
                'key' => 'romanesco.custom_css_path'
            ));
            if ($cssPathContext) {
                $cssPath = $cssPathContext->get('value');
            } else {
                $cssPath = $cssPath . '/' . $context;
            }

            // Generate static file
            if ($context) {
                $staticFile = $cssPath . '/site.css';

                if (!$modx->cacheManager->writeFile($staticFile, $css)) {
                    $modx->log(modX::LOG_LEVEL_ERROR, "Error caching output from Resource {$modx->resource->get('id')} to static file {$staticFile}", '', __FUNCTION__, __FILE__, __LINE__);
                }
            }

            // Sign up for minification
            $minifyCSS[] = $cssPath;
        }

        // Minify CSS
        if ($modx->getObject('cgSetting', array('key' => 'minify_css_js'))->get('value') == 1) {
            foreach ($minifyCSS as $path) {
                exec(
                    '"$HOME/.nvm/nvm-exec"' .
                    ' gulp minify-css --path ' . $path .
                    ' --gulpfile ' . escapeshellcmd($modx->getOption('assets_path')) . 'components/romanescobackyard/js/gulp/minify-css.js' .
                    ' > ' . escapeshellcmd($modx->getOption('core_path')) . 'cache/logs/minify.log' .
                    ' 2>' . escapeshellcmd($modx->getOption('core_path')) . 'cache/logs/minify-error.log &',
                    $output,
                    $return_css
                );
            }
        }

        // Bump CSS version number to force refresh
        $versionCSS = $modx->getObject('modSystemSetting', array('key' => 'romanesco.assets_version_css'));
        if ($versionCSS) {
            $versionCSS->set('value', $versionCSS->get('value') + 0.01);
            $versionCSS->save();
        } else {
            $modx->log(modX::LOG_LEVEL_ERROR, 'Could not find romanesco.assets_version_css setting');
        }

        // Clear cache
        $modx->cacheManager->refresh();

        break;
}