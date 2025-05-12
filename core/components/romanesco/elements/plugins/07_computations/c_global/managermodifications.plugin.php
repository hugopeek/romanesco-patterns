<?php
/**
 * ManagerModifications
 *
 * Small tweaks to the MODX backend, to enhance the Romanesco experience.
 *
 * @var modX $modx
 * @var modManagerController $controller
 *
 * @package romanesco
 */

$versionCSS = $modx->getOption('romanesco.assets_version_css');
$versionJS = $modx->getOption('romanesco.assets_version_js');

switch ($modx->event->name) {
    case 'OnDocFormRender':
        /**
         * @var modResource $resource
         */

        // Load custom CSS styles
        $modx->regClientCss($modx->getOption('base_url') . 'assets/components/romanescobackyard/css/contentblocks.css?v=' . $versionCSS);
        $modx->regClientCss($modx->getOption('base_url') . 'assets/components/romanescobackyard/css/semantic.css?v=' . $versionCSS); # for CB chunk previews
        $modx->regClientCss($modx->getOption('base_url') . 'assets/components/romanescobackyard/css/step.css?v=' . $versionCSS); # for CB chunk previews

        // Load custom CSS for Global Backgrounds
        if ($resource->get('template') == 27) {
            $modx->regClientCss($modx->getOption('base_url') . 'assets/components/romanescobackyard/css/backgrounds.css?v=' . $versionCSS);
        }
        break;

    case 'OnManagerPageBeforeRender':
        $modx->controller->addLexiconTopic('romanescobackyard:manager');

        // Load CSS for manager on different event
        $modx->regClientCss($modx->getOption('base_url') . 'assets/components/romanescobackyard/css/semantic.css?v=' . $versionCSS); # for CB chunk previews
        $modx->regClientCss($modx->getOption('base_url') . 'assets/components/romanescobackyard/css/manager.css?v=' . $versionCSS);

        // Load JS and additional dependencies
        $controller->addHtml('<script src="/assets/components/romanescobackyard/js/jquery.min.js"></script>');
        $controller->addHtml('<script src="/assets/semantic/dist/themes/romanesco/assets/vendor/arrive/arrive.min.js"></script>');
        $controller->addHtml('<script src="/assets/components/romanescobackyard/js/manager.js?v=' . $versionJS . '"></script>');

        // Hide advanced ContentBlocks features
        $settings = $modx->getOption('romanesco.cb_hide_settings');
        $fields = $modx->getOption('romanesco.cb_hide_fields');
        //$sudo = $modx->user->get('sudo');

        if ($settings || $fields) {
            $controller->addHtml($modx->getChunk('mgrHideFeaturesCB', [
                'settings' => $settings ?? '',
                'fields' => $fields ?? '',
            ]));
        }

        // Load Ybug widget for collecting manager feedback
        if ($modx->getOption('romanesco.manager_feedback') == 1) {
            if ($modx->user->hasSessionContext('mgr')) {
                $userName = $modx->user->get('username');
                $userEmail = $modx->user->getOne('Profile')->get('email');
            }
            $controller->addHtml($modx->getChunk('feedbackWidgetJS', [
                'project_id' => $modx->getOption('romanesco.ybug_project_id'),
                'username' => $userName ?? '',
                'email' => $userEmail ?? '',
                'button_text' => $modx->lexicon('romanesco.feedback.button_text'),
                'position' => 'bottom-right',
            ]));
        }
        break;

    case 'OnManagerPageAfterRender':
        // Mute rogue output lines from certain packages
        $removeLines = array(
            $modx->getOption('core_path') . 'components/imageplus/elements/tv/output/',
            $modx->getOption('core_path') . 'components/colorpicker/elements/tv/output/',
            $modx->getOption('core_path') . 'components/redactor/elements/tvs/output/',
        );

        $managerContent = $modx->controller->content;
        $managerContent = str_replace($removeLines, '', $managerContent);

        // Remove underscore prefix in TV category tabs (so custom categories can have same name as core categories)
        $managerContent = str_replace('class="x-tab" title="_', 'class="x-tab" title="', $managerContent);
        // And while we're at it...
        $managerContent = str_replace('class="x-tab" title="Person - ', 'class="x-tab" title="', $managerContent);
        $managerContent = str_replace('class="x-tab" title="Org - ', 'class="x-tab" title="', $managerContent);

        $controller->content = $managerContent;
        break;
}
return;