<?php

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

        // Get current configuration settings (before save)
        $currentSettings = $clientConfig->getSettings();

        // Get saved values
        $savedSettings = (!empty($_POST['values'])) ? $_POST['values'] : '[]';
        $savedSettings = json_decode($savedSettings, true);
        if (!is_array($savedSettings)) {
            $modx->log(modX::LOG_LEVEL_ERROR, '[UpdateStyling] No values array available');
            break;
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
        if ($currentSettingsTheme['logo_path'][0] === '/' || $currentSettingsTheme['logo_badge_path'][0] === '/') {
            $currentSettingsTheme['logo_path'] = substr($currentSettingsTheme['logo_path'], 1);
            $currentSettingsTheme['logo_badge_path'] = substr($currentSettingsTheme['logo_badge_path'], 1);
        }

        // Compare saved settings to current settings
        $updatedSettings = array_diff($savedSettingsTheme, $currentSettingsTheme);
        $deletedSettings = array_diff($currentSettingsTheme, $savedSettingsTheme);

        $output = array();

        // Regenerate styling elements if theme settings were updated or deleted
        if ($updatedSettings || $deletedSettings) {
            // Clear cache, to ensure build process uses the latest values
            $modx->getCacheManager()->delete('clientconfig',array(xPDO::OPT_CACHE_KEY => 'system_settings'));
            if ($modx->getOption('clientconfig.clear_cache', null, true)) {
                $modx->getCacheManager()->delete('',array(xPDO::OPT_CACHE_KEY => 'resource'));
            }

            //$command = '/home/hugo/.npm-global/bin/gulp --gulpfile ' . escapeshellcmd($modx->getOption('assets_path')) . 'semantic/gulpfile.js build-css > ./logs/romanesco.log 2>./logs/error.log &';
            //$command = 'gulp --gulpfile ' . escapeshellcmd($modx->getOption('assets_path')) . 'semantic/gulpfile.js build-css > ' .escapeshellcmd($modx->getOption('core_path')) . 'cache/logs/romanesco.log 2>' .escapeshellcmd($modx->getOption('core_path')) . 'cache/logs/romanesco.log &';

            // Create directory for logs (if it doesn't exist already)
            //exec('cd ' . escapeshellcmd($modx->getOption('core_path')) . ' && mkdir -p logs 2>&1', $output);

            // Terminate any existing gulp processes
            $killCommand = "ps aux | grep '[g]ulpfile " . $modx->getOption('assets_path') . "semantic/gulpfile.js' | awk '{print $2}'";
            exec(
                'kill $(' . $killCommand . ') 2> /dev/null',
                $output,
                $return_kill
            );

            //$modx->log(modX::LOG_LEVEL_ERROR, 'return kill: ' . $return_kill);

            // Run gulp process to generate new CSS
            exec(
                'gulp build-css' .
                ' --gulpfile ' . escapeshellcmd($modx->getOption('assets_path')) . 'semantic/gulpfile.js' .
                ' > ' .escapeshellcmd($modx->getOption('core_path')) . 'cache/logs/romanesco.log' .
                ' 2>' .escapeshellcmd($modx->getOption('core_path')) . 'cache/logs/romanesco.log &',
                //' 2>&1 | tee -a ' .escapeshellcmd($modx->getOption('core_path')) . 'cache/logs/romanesco.log',
                $output,
                $return_css
            );

            // Update favicon if a new logo image was provided
            if (array_key_exists('logo_badge_path', $updatedSettings)) {
                //$modx->log(modX::LOG_LEVEL_ERROR, '[UpdateStyling] Logo badge was changed');
                $logoBadgePath = $modx->getOption('base_path') . $savedSettingsTheme['logo_badge_path'];

                exec(
                    'gulp generate-favicon' .
                    ' --gulpfile ' . escapeshellcmd($modx->getOption('assets_path')) . 'favicons/generate-favicons.js' .
                    ' --name ' . escapeshellarg($modx->getOption('site_name')) .
                    ' --img ' . escapeshellarg($logoBadgePath) .
                    ' --primary ' . escapeshellarg($savedSettingsTheme['theme_color_primary']) .
                    ' --secondary ' . escapeshellarg($savedSettingsTheme['theme_color_secondary']) .
                    ' > ' .escapeshellcmd($modx->getOption('core_path')) . 'cache/logs/favicon.log' .
                    ' 2>' .escapeshellcmd($modx->getOption('core_path')) . 'cache/logs/favicon.log &',
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
            foreach ($output as $line) {
                $errorMsg .= "\n" . $line;
            }
            return (" Report: " . $errorMsg);
        }

        break;
}