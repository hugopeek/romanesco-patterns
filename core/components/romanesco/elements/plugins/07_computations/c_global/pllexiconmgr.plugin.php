<?php
$modx->controller->addLexiconTopic('romanescobackyard:manager');

// Load custom CSS styles for ContentBlocks
$modx->regClientCss($modx->getOption('base_url') . 'assets/components/romanescobackyard/css/contentblocks.css');

// Mute strange and elusive ImagePlus output line
if ($modx->event->name == 'OnManagerPageAfterRender') {
    $outputToRemove = $modx->getOption('core_path') . 'components/imageplus/elements/tv/output/';
    $controller->content = str_replace($outputToRemove, '', $modx->controller->content);
}