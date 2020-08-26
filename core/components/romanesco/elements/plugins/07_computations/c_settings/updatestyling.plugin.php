<?php
/**
 * UpdateStyling
 *
 * This plugin is activated when certain theme settings are changed in the
 * ClientConfig CMP.
 *
 * It changes some variables used by Semantic UI to generate the CSS and it also
 * triggers a new SUI build in the background. This requires NPM to be available
 * on the server, as well as the exec function.
 *
 * NB! ENABLING THE EXEC FUNCTION ON YOUR SERVER IS A POTENTIAL SECURITY RISK!
 * Please make sure your server and MODX install are sufficiently hardened
 * before enabling this functionality. You can always update the SUI styling and
 * run the build process manually, so there's no harm done if this plugin can't
 * be activated.
 *
 * It also generates favicon images if a logo badge is provided. This relies on
 * a few Gulp dependencies (see package.json) and the Real Favicon service:
 * https://realfavicongenerator.net/favicon/gulp
 *
 * Update May 15, 2020:
 * This plugin is now able to process context-aware configuration settings.
 *
 * Update May 20, 2020:
 * The plugin no longer relies on an assets/css/theme.variables resource to be
 * present in MODX. The settings are directly written to a static file now.
 *
 * @var modX $modx
 * @package romanesco
 */

// Check if exec function is available on the server
if(@exec('echo EXEC') !== 'EXEC'){
    $modx->log(modX::LOG_LEVEL_ERROR, '[UpdateStyling] Exec function not available');
    return false;
}

$eventName = $modx->event->name;

switch($eventName) {
    case 'ClientConfig_ConfigChange':
        $path = $modx->getOption('clientconfig.core_path', null, $modx->getOption('core_path') . 'components/clientconfig/');
        $path .= 'model/clientconfig/';
        $clientConfig = $modx->getService('clientconfig','ClientConfig', $path);
        $imgMediaSource = $modx->getObject('sources.modMediaSource', 15);
        $output = array();

        // Get saved values
        $savedSettings = (!empty($_POST['values'])) ? $_POST['values'] : '[]';
        $savedSettings = json_decode($savedSettings, true);
        if (!is_array($savedSettings)) {
            $modx->log(modX::LOG_LEVEL_ERROR, '[UpdateStyling] No values array available');
            break;
        }

        // Get current configuration settings (before save) for active context
        $currentContext = $savedSettings['context'];
        $currentSettings = $clientConfig->getSettings($currentContext);
        if ($clientConfig instanceof ClientConfig) {
            $cacheOptions = array(xPDO::OPT_CACHE_KEY => 'system_settings');
            $settings = $modx->getCacheManager()->get('clientconfig', $cacheOptions);
        }

        // Continue with theme related settings only
        if (!function_exists('filterThemeSettings')) {
            function filterThemeSettings($settings) {
                return array_filter(
                    $settings,
                    function ($key) {
                        if (strpos($key, 'theme_') === 0 || strpos($key, 'logo_') === 0) {
                            return $key;
                        }
                        else {
                            return false;
                        }
                    },
                    ARRAY_FILTER_USE_KEY
                );
            }
        }
        $currentSettingsTheme = filterThemeSettings($currentSettings);
        $savedSettingsTheme = filterThemeSettings($savedSettings);

        // Remove leading '/' slash from path values
        // This somehow gets added by MODX, resulting in these keys being incorrectly flagged as changed
        $currentSettingsTheme['logo_path'] = ltrim($currentSettingsTheme['logo_path'],'/');
        $currentSettingsTheme['logo_badge_path'] = ltrim($currentSettingsTheme['logo_badge_path'],'/');

        // Add media source to saved paths
        if ($savedSettingsTheme['logo_path']) {
            $savedSettingsTheme['logo_path'] = $imgMediaSource->prepareOutputUrl($savedSettingsTheme['logo_path']);
        }
        if ($savedSettingsTheme['logo_badge_path']) {
            $savedSettingsTheme['logo_badge_path'] = $imgMediaSource->prepareOutputUrl($savedSettingsTheme['logo_badge_path']);
        }

        // Compare saved settings to current settings
        $updatedSettings = array_diff($savedSettingsTheme, $currentSettingsTheme);
        $deletedSettings = array_diff($currentSettingsTheme, $savedSettingsTheme);

        // Regenerate styling elements if theme settings were updated or deleted
        if ($updatedSettings || $deletedSettings) {

            // Set theme.variables path for current context
            $themesFolder = $modx->getOption('base_path') . 'assets/semantic/src/themes/';
            if ($currentContext) {
                $themeVariablesPath = $themesFolder . $currentContext . '/globals/theme.variables';
            } else {
                $themeVariablesPath = $themesFolder . 'project/globals/theme.variables';
            }

            // Clear cache, to ensure build process uses the latest values
            $modx->getCacheManager()->delete('clientconfig',array(xPDO::OPT_CACHE_KEY => 'system_settings'));

            // Grab variables after cache rebuild
            $newSettings = $clientConfig->getSettings($currentContext);

            // NB: for some reason, using getChunk directly here doesn't work (when using settings array as content)
            $themeVariables = $modx->getObject('modChunk', array('name'=>'themeVariables'));
            $themeVariables->setCacheable(false);

            // Write to theme.variables
            $pathInfo = pathinfo($themeVariablesPath);
            $path = $pathInfo['dirname'];

            if (!file_exists($path)) {
                mkdir($path, 0755, true);
            }

            file_put_contents(
                $themeVariablesPath,
                $themeVariables->process($newSettings, $themeVariables)
            );

            // Terminate any existing gulp processes first
            $killCommand = "ps aux | grep '[g]ulp build-' | awk '{print $2}'";
            exec(
                'kill $(' . $killCommand . ') 2> /dev/null',
                $output,
                $return_kill
            );

            // Construct build command
            if ($currentContext) {
                $distPath = $modx->getObject('modContextSetting', array(
                    'context_key' => $currentContext,
                    'key' => 'romanesco.semantic_dist_path'
                ));
                $buildCommand = 'gulp build-context --key ' . $currentContext . ' --dist ' . $modx->getOption('base_path') . $distPath->get('value');
            }
            else {
                $buildCommand = 'gulp build-css';
            }

            // Run gulp process to generate new CSS
            exec(
                '"$HOME/.nvm/nvm-exec" ' . $buildCommand .
                ' --gulpfile ' . escapeshellcmd($modx->getOption('assets_path')) . 'components/romanescobackyard/js/gulp/generate-multicontext-css.js' .
                ' > ' . escapeshellcmd($modx->getOption('core_path')) . 'cache/logs/css.log' .
                ' 2>' . escapeshellcmd($modx->getOption('core_path')) . 'cache/logs/css-error.log &',
                $output,
                $return_css
            );

            // Bump CSS version number to force refresh
            $versionCSS = $modx->getObject('modSystemSetting', array('key' => 'romanesco.assets_version_css'));
            if ($versionCSS) {
                $versionCSS->set('value', $versionCSS->get('value') + 0.01);
                $versionCSS->save();
            } else {
                $modx->log(modX::LOG_LEVEL_ERROR, 'Could not find romanesco.assets_version_css setting');
            }

            // Update favicon if a new logo image was provided
            if (array_key_exists('logo_badge_path', $updatedSettings)) {
                $logoBadgePath = $modx->getOption('base_path') . $savedSettingsTheme['logo_badge_path'];

                exec(
                    '"$HOME/.nvm/nvm-exec"' .
                    ' gulp generate-favicon' .
                    ' --gulpfile ' . escapeshellcmd($modx->getOption('assets_path')) . 'components/romanescobackyard/js/gulp/generate-favicons.js' .
                    ' --name ' . escapeshellarg($modx->getOption('site_name')) .
                    ' --img ' . escapeshellarg($logoBadgePath) .
                    ' --primary ' . escapeshellarg($savedSettingsTheme['theme_color_primary']) .
                    ' --secondary ' . escapeshellarg($savedSettingsTheme['theme_color_secondary']) .
                    ' > ' . escapeshellcmd($modx->getOption('core_path')) . 'cache/logs/favicon.log' .
                    ' 2>' . escapeshellcmd($modx->getOption('core_path')) . 'cache/logs/favicon-error.log &',
                    $output,
                    $return_favicon
                );

                // Bump favicon version number to force refresh
                $version = $modx->getObject('modSystemSetting', array('key' => 'romanesco.favicon_version'));
                if ($version) {
                    $version->set('value', $version->get('value') + 0.1);
                    $version->save();
                } else {
                    $modx->log(modX::LOG_LEVEL_ERROR, 'Could not find favicon_version setting');
                }
            }

            // Prevent favicons from being loaded if badge image was removed
            if (array_key_exists('logo_badge_path', $deletedSettings)) {
                $version = $modx->getObject('modSystemSetting', array('key' => 'romanesco.favicon_version'));
                if ($version) {
                    $version->set('value', '');
                    $version->save();
                } else {
                    $modx->log(modX::LOG_LEVEL_ERROR, 'Could not find favicon_version setting');
                }
            }

            // Clear cache
            $modx->cacheManager->refresh();
        }

        // Report any validation errors in log
        if (array_filter($output)) {
            $errorMsg = '';
            foreach ($output as $line) {
                $errorMsg .= "\n" . $line;
            }
            return (" Report: " . $errorMsg);
        }

        break;
}