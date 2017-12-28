<?php
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

        // Compare saved settings to current settings
        $updatedSettings = array_diff($savedSettingsTheme, $currentSettingsTheme);

        // If any theme settings were updated, regenerate Semantic UI CSS
        if ($updatedSettings) {

            // Clear cache, to ensure build process uses the latest values
            $modx->getCacheManager()->delete('clientconfig',array(xPDO::OPT_CACHE_KEY => 'system_settings'));
            if ($modx->getOption('clientconfig.clear_cache', null, true)) {
                $modx->getCacheManager()->delete('',array(xPDO::OPT_CACHE_KEY => 'resource'));
            }

            //$command = 'cd ' . escapeshellcmd($modx->getOption('assets_path')) . 'semantic && which gulp > ./logs/romanesco.log 2>./logs/error.log &';
            $command = '/home/hugo/.npm-global/bin/gulp --gulpfile ' . escapeshellcmd($modx->getOption('assets_path')) . 'semantic/gulpfile.js build-css 2>&1';
            $output = array();

            // Create directory for logs
            //exec('cd ' . escapeshellcmd($modx->getOption('assets_path')) . 'semantic && mkdir logs 2>&1', $output);

            //$modx->log(modX::LOG_LEVEL_ERROR, 'Temp file "' . $tempFile . '"" created at ' . sys_get_temp_dir() );
            //$modx->log(modX::LOG_LEVEL_ERROR, 'Temp file content:' . file_get_contents($tempFile) );


            $output = array();
            exec($command,$output,$return_value);
        }

        // Report any validation errors in log
        if (array_filter($output)) {
            foreach ($output as $line) {
                $errorMsg .= "\n" . $line;
            }
            return (" Failure: " . $errorMsg);
        }

        break;
}