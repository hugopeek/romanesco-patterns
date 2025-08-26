<?php
/**
 * ReadingTime plugin
 *
 * Calculate the time needed to read the full text of an article.
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @package romanesco
 */

use Wa72\HtmlPageDom\HtmlPageCrawler;

switch ($modx->event->name) {
    case 'OnWebPagePrerender':

        // Get processed output of resource
        $content = &$modx->resource->_output;

        // Cached DOM output already has reading time set
        $cacheManager = $modx->getCacheManager();
        $cacheElementKey = '/dom';
        $cacheOptions = [
            xPDO::OPT_CACHE_KEY => 'resource/' . $modx->resource->getCacheKey()
        ];
        $cachedOutput = $cacheManager->get($cacheElementKey, $cacheOptions);
        $isLoggedIn = $modx->user->hasSessionContext($modx->context->get('key'));
        if ($cachedOutput && !$isLoggedIn) {
            $modx->log(modX::LOG_LEVEL_DEBUG, '[Romanesco3x] Loading reading time from cache');
            break;
        }

        // Feed output to HtmlPageDom
        $dom = new HtmlPageCrawler($content);

        // Isolate article
        $article = $dom->filter('#content');

        // Calculate reading time
        $words = str_word_count(strip_tags($article));
        $wpm = (int)$modx->getOption("romanesco.reading_time_wpm", null, 180);
        $min = round($words / $wpm);
        $text = ($min <= 1) ? 'minute' : 'minutes';

        if ($min < 1) $min = '< 1';

        // Append menu to HTML container
        $dom->filter('.reading-time')->append("$min $text");
        $content = $dom->saveHTML();

        break;

}

return true;