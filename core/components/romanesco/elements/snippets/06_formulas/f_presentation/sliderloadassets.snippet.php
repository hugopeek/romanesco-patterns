<?php
/**
 * sliderLoadAssets
 *
 * Loads dependencies for the Swiper carousel (https://swiperjs.com/).
 */

$id = $modx->getOption('swiperID', $scriptProperties, 'swiper-0');
$cols = $modx->getOption('columns', $scriptProperties, 1);
$scroll = $modx->getOption('slidesToScroll', $scriptProperties, 1);
$direction = $modx->getOption('direction', $scriptProperties, 'horizontal');
$spacing = $modx->getOption('spacing', $scriptProperties, 'none');
$behaviour = $modx->getOption('behaviour', $scriptProperties, '');
$transition = $modx->getOption('transition', $scriptProperties, 'slide');
$lazyload = $modx->getOption('lazyLoad', $scriptProperties, false);
$pagination = $modx->getOption('pagination', $scriptProperties, false);
$responsive = $modx->getOption('responsive', $scriptProperties, 0);
$tpl = $modx->getOption('tpl', $scriptProperties, 'sliderInitJS');

// Convert option values to JS settings
// Keep in mind that 'true' / 'false' needs to be a string here
// -----------------------------------------------------------------------------

// Convert semantic padding to numeric value
switch ($spacing) {
    case 'relaxed':
        $spacing = 20;
        break;
    case 'very relaxed':
        $spacing = 30;
        break;
    default:
        $spacing = 0;
        break;
}

// Create variable for each behaviour setting
$behaviour = explode(',', $behaviour);
foreach ($behaviour as $option) {
    $$option = 'true';
}

// Only bullet pagination can be clickable
$clickable = ($pagination == 'bullets') ? 'true' : 'false';

// Effects
$effects = array(
    'fade' => '
        fadeEffect: {
            crossFade: true
        },
    ',
    'coverflow' => '
        coverflowEffect: {
            rotate: 30,
            slideShadows: false,
        },
    ',
    'flip' => '
        flipEffect: {
            rotate: 30,
            slideShadows: false,
        },
    ',
    'cube' => '
        cubeEffect: {
            slideShadows: false,
        },
    ',
);

// Responsive
if ($responsive) {
    $breakpoints = "
    breakpoints: {
        '@0.75': {
            slidesPerView: " . round($cols / 2) . ",
            spaceBetween: " . $spacing / 2 . ",
        },
        '@1.00': {
            slidesPerView: " . round($cols * 0.75) . ",
            spaceBetween: $spacing,
        },
        '@1.50': {
            slidesPerView: $cols,
            spaceBetween: " . $spacing * 1.5 . ",
        },
    },
    ";

    // This feature is mobile-first, so set columns for smallest screens
    $cols = round($cols / 4);
}

// Load assets in head and footer
// -----------------------------------------------------------------------------

// Check if minify assets setting is activated in Configuration
$minify = '';
if ($modx->getObject('cgSetting', array('key' => 'minify_css_js'))->get('value') == 1) {
    $minify = '.min';
}

// Paths
$assetsPathCSS = $modx->getOption('romanesco.custom_css_path', $scriptProperties, '');
$assetsPathJS = $modx->getOption('romanesco.custom_js_path', $scriptProperties, '');
$assetsPathVendor = $modx->getOption('romanesco.custom_vendor_path', $scriptProperties, '');

// Head
//$modx->regClientCSS($assetsPathCSS . '/slider' . $minify . '.css');
$modx->regClientCSS($assetsPathCSS . '/swiper' . $minify . '.css');

// Footer
//$modx->regClientScript($assetsPathJS . '/slider' . $minify . '.js');
$modx->regClientScript('/' . $assetsPathVendor . '/swiper/swiper.min.js');
$modx->regClientScript('/' . $assetsPathJS . '/swiper' . $minify . '.js');
$modx->regClientHTMLBlock($modx->getChunk($tpl, array(
    'var' => str_replace('-','',$id),
    'id' => $id,
    'cols' => $cols,
    'slides_to_scroll' => $scroll,
    'direction' => $direction,
    'spacing' => $spacing,
    'loop' => $loop ?? 'false',
    'center' => $center ?? 'false',
    'free' => $free ?? 'false',
    'transition' => $transition,
    'pagination' => $pagination,
    'clickable' => $clickable,
    'breakpoints' => $breakpoints ?? '',
    'effects' => $effects[$transition] ?? '',
)));

return '';