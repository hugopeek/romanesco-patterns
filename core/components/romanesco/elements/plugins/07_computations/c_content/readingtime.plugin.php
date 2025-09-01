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
    case 'OnDocFormSave':
        /** @var modResource $resource */

        // Clear reading time to trigger recalculation
        $resource->setTVValue('reading_time', '');

        break;

    case 'OnWebPagePrerender':

        if ($modx->resource->getTVValue('reading_time')) {
            break;
        }

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

        // Isolate article content
        $article = $dom->filter('#content');

        // Calculate reading time
        $words = str_word_count(strip_tags($article));
        $wpm = (int)$modx->getOption("romanesco.reading_time_wpm", null, 180); // wpm = words per minute
        $time = round($words / $wpm);

        // Set singular or plural label
        $label = $modx->lexicon('romanesco.article.reading_time');
        if ($time <= 1) $label = $modx->lexicon('romanesco.article.reading_time_1');

        // Add to content (empty text to avoid duplicates)
        $dom->filter('.reading-time .value')->makeEmpty()->append("$time");
        $dom->filter('.reading-time .label')->makeEmpty()->append("$label");
        $content = $dom->saveHTML();

        // Save to TV (make sure it is assigned to the template!)
        $modx->resource->setTVValue('reading_time', $time);
        $modx->resource->save();

        break;
}

return true;