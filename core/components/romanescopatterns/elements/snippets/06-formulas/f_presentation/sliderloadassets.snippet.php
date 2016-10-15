<?php
/**
 * sliderLoadAssets
 *
 * Loads dependencies for the Slick carousel (http://kenwheeler.github.io/slick/).
 */

$assetsPathCSS = $modx->getOption('romanesco.custom_css_path');
$assetsPathJS = $modx->getOption('romanesco.custom_js_path');
$assetsPathVendor = $modx->getOption('romanesco.custom_vendor_path');

// Head
$modx->regClientCSS($assetsPathVendor . '/slick-carousel/slick.css');
$modx->regClientCSS($assetsPathVendor . '/slick-carousel/slick-theme.css');
$modx->regClientCSS($assetsPathVendor . '/slick-lightbox/slick-lightbox.css');

// Footer
//$modx->regClientScript('//code.jquery.com/jquery-migrate-1.2.1.min.js');
$modx->regClientScript($assetsPathVendor . '/slick-carousel/slick.min.js');
$modx->regClientScript($assetsPathVendor . '/slick-lightbox/slick-lightbox.min.js');
$modx->regClientScript($assetsPathJS . '/slider.js');