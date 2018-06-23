<?php
$modx->controller->addLexiconTopic('romanescobackyard:manager');

// Load custom CSS styles for ContentBlocks
$modx->regClientCss($modx->getOption('base_url') . 'assets/components/romanescobackyard/css/contentblocks.css');

// Mute rogue output lines from certain packages
if ($modx->event->name == 'OnManagerPageAfterRender') {
    $removeLineImagePlus = $modx->getOption('core_path') . 'components/imageplus/elements/tv/output/';
    $removeLineColorPicker = $modx->getOption('core_path') . 'components/colorpicker/elements/tv/output/';

    $managerContent = $modx->controller->content;
    $managerContent = str_replace($removeLineImagePlus, '', $managerContent);
    $managerContent = str_replace($removeLineColorPicker, '', $managerContent);

    $controller->content = $managerContent;
}