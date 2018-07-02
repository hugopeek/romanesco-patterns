<?php
$modx->controller->addLexiconTopic('romanescobackyard:manager');

switch ($modx->event->name) {
    // Load custom CSS styles for ContentBlocks
    case 'OnDocFormRender':
        $modx->regClientCss($modx->getOption('base_url') . 'assets/components/romanescobackyard/css/contentblocks.css');
        break;
        
    // Mute rogue output lines from certain packages
    case 'OnManagerPageAfterRender':
        $removeLineImagePlus = $modx->getOption('core_path') . 'components/imageplus/elements/tv/output/';
        $removeLineColorPicker = $modx->getOption('core_path') . 'components/colorpicker/elements/tv/output/';

        $managerContent = $modx->controller->content;
        $managerContent = str_replace($removeLineImagePlus, '', $managerContent);
        $managerContent = str_replace($removeLineColorPicker, '', $managerContent);

        $controller->content = $managerContent;
        break;
}
return;