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

        // Abort if resource template is not GlobalBackground(s)
        $templateID = $resource->get('template');
        if ($templateID != 27 && $templateID != 8) {
            return true;
        }

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

        // Each container represents a context
        foreach ($bgContainers as $container) {
            $context = $container->get('alias');

            // Generate CSS for each context
            $css = $modx->getChunk($cssChunk, array(
                'context' => $context,
            ));

            if ($context) {
                $staticFile = $modx->getOption('base_path') . 'assets/css/' . $context . '.css';

                if (!$modx->cacheManager->writeFile($staticFile, $css)) {
                    $modx->log(modX::LOG_LEVEL_ERROR, "Error caching output from Resource {$modx->resource->get('id')} to static file {$staticFile}", '', __FUNCTION__, __FILE__, __LINE__);
                }
            }
        }

        // Also generate a default CSS file
        $staticFile = $modx->getOption('base_path') . 'assets/css/site.css';
        $css = $modx->getChunk($cssChunk);

        if (!$modx->cacheManager->writeFile($staticFile, $css)) {
            $modx->log(modX::LOG_LEVEL_ERROR, "Error caching output from Resource {$modx->resource->get('id')} to static file {$staticFile}", '', __FUNCTION__, __FILE__, __LINE__);
        }

        // Minify CSS
        if ($modx->getObject('cgSetting', array('key' => 'minify_css_js'))->get('value') == 1) {
            exec(
                'NODE_VERSION=12 "$HOME/.nvm/nvm-exec"' .
                ' gulp build-custom' .
                ' --gulpfile ' . escapeshellcmd($modx->getOption('assets_path')) . 'semantic/gulpfile.js' .
                ' 2>&1 &',
                $output,
                $return_css
            );
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