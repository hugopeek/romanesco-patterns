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
            $css = $modx->getChunk('css', array(
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
        $css = $modx->getChunk('css');

        if (!$modx->cacheManager->writeFile($staticFile, $css)) {
            $modx->log(modX::LOG_LEVEL_ERROR, "Error caching output from Resource {$modx->resource->get('id')} to static file {$staticFile}", '', __FUNCTION__, __FILE__, __LINE__);
        }

        break;
}