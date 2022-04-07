<?php
/**
 * LexiconWeb
 *
 * Load default lexicon in web context.
 *
 * @var modX $modx
 * @package romanesco
 */

if ($modx->event->name == 'OnHandleRequest') {
    $modx->lexicon->load('romanescobackyard:default');
}