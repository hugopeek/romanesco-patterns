<?php
$modx->controller->addLexiconTopic('romanescobackyard:manager');

# Load custom CSS styles for ContentBlocks
$url = $modx->getOption('base_url') . 'assets/components/romanescobackyard/css/contentblocks.css';
$modx->regClientCss($url);