<?php
/**
 * iconInputOptions
 *
 * Based on fontAwesomeInputOptions, but modified to be used with Semantic UI.
 *
 * @author YJ Tso @sepiariver
 * GPL, no warranties, etc.
 *
 * Usage: execute in TV input options, preferably with @CHUNK binding.
 * Alternatively install as Content Blocks input (link to repo coming soon).
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var string $input
 * @var string $options
 */

// source file
use FractalFarming\Romanesco\Romanesco;

$cssUrl = $modx->getOption('cssUrl', $scriptProperties, 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/fontawesome.min.css');
// scan options
$regexPrefix = $modx->getOption('regexPrefix', $scriptProperties, 'fa-');
// label text output options
$mode = $modx->getOption('mode', $scriptProperties, 'tv'); // can be 'tv' or 'cb'
$titleCaseLabels = $modx->getOption('titleCaseLabels', $scriptProperties, 1);
$operator = $modx->getOption('operator', $scriptProperties, '');
if (empty($operator)) {
    $operator = ($mode === 'cb') ? '=' : '==';
}
// value text output options
$outputPrefix = $modx->getOption('classPrefix', $scriptProperties, 'fa-');
// list output options
$separator = $modx->getOption('separator', $scriptProperties, '');
if (empty($separator)) {
    $separator = ($mode === 'cb') ? "\n" : '||';
}
$excludeClasses = array_filter(array_map('trim', explode(',', $modx->getOption('excludeClasses', $scriptProperties, 'ul,li'))));
// check cache
$cacheKey = $modx->getOption('cacheKey', $scriptProperties, 'icons_css');
$provider = $modx->cacheManager->getCacheProvider('default');
$css = $provider->get($cacheKey);
if (!$css) {
    // get source file
    $css = file_get_contents($cssUrl);
    if ($css) {
        $provider->set($cacheKey, $css, 0);
    } else {
        $modx->log(modX::LOG_LEVEL_ERROR, '[iconInputOptions] could not get css source!');
        return '';
    }
}
// output
$output = array();
$regex = "/" . $regexPrefix . "([\w.-]*)/";
if (preg_match_all($regex, $css, $matches)) {
    $icons = array_diff($matches[1], $excludeClasses);
    $icons = array_unique($icons);
    sort($icons);
    foreach($icons as $icon) {
        $label = ($titleCaseLabels) ? ucwords(str_replace('.', ' ', $icon)) : $icon;
        $icon = str_replace('.', ' ', $icon);
        $output[] = $label . $operator . $icon . $outputPrefix;
    }
}
// custom social media classes
if ($modx->romanesco instanceof Romanesco) {
    // check cache
    $cacheKey = $modx->getOption('cacheKey', $scriptProperties, 'icons_social');
    $provider = $modx->cacheManager->getCacheProvider('default');
    $socialIcons = $provider->get($cacheKey);
    if (!$socialIcons) {
        $socialShare = $modx->getCollection('FractalFarming\Romanesco\Model\SocialShare', ['deleted' => 0]);
        $socialConnect = $modx->getCollection('FractalFarming\Romanesco\Model\SocialConnect', ['deleted' => 0]);
        $socialIcons = [];
        foreach ($socialShare as $channel) {
            $name = $channel->get('name');
            $icon = $channel->get('icon');
            $alias = $modx->filterPathSegment($name);
            $class = $icon ?: $alias;
            $socialIcons[$modx->filterPathSegment($class)] = [
                'label' => $name,
                'class' => $class,
            ];
        }
        foreach ($socialConnect as $channel) {
            $name = $channel->get('name');
            $icon = $channel->get('icon');
            $alias = $modx->filterPathSegment($name);
            $class = $icon ?: $alias;
            $socialIcons[$modx->filterPathSegment($class)] = [
                'label' => $name,
                'class' => $class,
            ];
        }
        $provider->set($cacheKey, $socialIcons, 0);
    }
    foreach($socialIcons as $icon) {
        $output[] = $icon['label'] . $operator . $icon['class'] . $outputPrefix;
    }
}

return implode($separator, $output);