<?php
/**
 * ManipulateDOM plugin
 *
 * This plugin utilizes HtmlPageDom, a page crawler that can manipulate DOM
 * elements for us. Yes, that is exactly what jQuery does... But now we can do
 * it server side, before the page is rendered. Much faster and more reliable.
 *
 * @var modX $modx
 * @package romanesco
 */

$corePath = $modx->getOption('htmlpagedom.core_path', null, $modx->getOption('core_path') . 'components/htmlpagedom/');

if (!class_exists('\Wa72\HtmlPageDom\HtmlPageCrawler')) {
    require $corePath . 'vendor/autoload.php';
}

use \Wa72\HtmlPageDom\HtmlPageCrawler;

switch ($modx->event->name) {
    case 'OnWebPagePrerender':

        // Check if content type is text/html
        if (!in_array($modx->resource->get('content_type'), [1,11])) {
            break;
        }

        // Get processed output of resource
        $output = &$modx->resource->_output;

        // Feed output to HtmlPageDom
        $dom = new HtmlPageCrawler($output);

        // Add non-white class to body if custom background is set
        try {
            if ($modx->getObject('cgSetting', array('key' => 'theme_page_background_color'))->get('value') !== 'ffffff') {
                $dom->filter('body')->addClass('non-white');
            }
        }
        catch (Error $e) {
            $modx->log(modX::LOG_LEVEL_ERROR, $e);
        }

        // Add header class to content headers without class name
        $dom->filter('h1:not(.header)')->addClass('ui header');
        $dom->filter('h2:not(.header)')->addClass('ui header');
        $dom->filter('h3:not(.header)')->addClass('ui header');
        $dom->filter('h4:not(.header)')->addClass('ui header');
        $dom->filter('h5:not(.header)')->addClass('ui header');

        // Inject inverted classes to elements inside inverted segments
        $dom->filter('.inverted.segment')
            ->each(function (HtmlPageCrawler $segment) {

                // Define elements that need to receive the inverted class
                $elements = array(
                    '.header',
                    '.grid',
                    'a:not(.button)',
                    '.button:not(.primary):not(.secondary)',
                    '.subtitle',
                    '.lead',
                    '.list',
                    '.quote',
                    '.divider:not(.hidden)',
                    '.basic.form',
                    '.accordion:not(.styled)',
                    '.text.menu',
                );

                // Revert inverted styling inside these nested elements
                $exceptions = array(
                    '.segment:not(.inverted):not(.transparent)',
                    '.card',
                    '.tabbed.menu',
                    '.accordion:not(.inverted)',
                    '.popup:not(.inverted)',
                    '.message',
                    '.leaflet-container',
                );

                // Prevent elements from having the same color as their parent background
                if ($segment->hasClass('primary-color')) {
                    $segment
                        ->filter('.primary.button')
                        ->removeClass('basic')
                        ->addClass('inverted')
                    ;
                    $segment
                        ->filter('.bottom.attached.primary.button')
                        ->removeClass('primary')
                        ->addClass('secondary')
                    ;
                }
                if ($segment->hasClass('secondary-color')) {
                    $segment
                        ->filter('.secondary.button')
                        ->removeClass('basic')
                        ->addClass('inverted')
                    ;
                }

                // Elements
                foreach ($elements as $element) {
                    $segment
                        ->filter($element)
                        ->addClass('inverted')
                    ;
                }

                // Exceptions
                foreach ($exceptions as $exception) {
                    $segment
                        ->filter($exception)
                        ->each(function(HtmlPageCrawler $node) {
                            $node
                                ->filter('.inverted')
                                ->removeClass('inverted')
                            ;
                        })
                    ;
                }
            })
        ;

        // Remove rows from grids that have a reversed column order on mobile
        $dom->filter('.ui.reversed.grid > .row')->unwrapInner();

        // If grids are stackable on tablet, also hide designated mobile elements
        $dom->filter('.ui[class*="stackable on tablet"].grid [class*="mobile hidden"]')
            ->removeClass('mobile')
            ->removeClass('hidden')
            ->addClass('tablet or lower hidden')
        ;

        // If grids are stackable on tablet, some responsive image sizes might be incorrect
        $dom->filter('.ui[class*="stackable on tablet"].grid .column > .ui.content.image > img')
            ->each(function(HtmlPageCrawler $img) {
                $dataSizes = $img->getAttribute('data-sizes');
                $sizes = $dataSizes ?? $img->getAttribute('sizes');

                if (!$sizes) return;

                // If lazy load is enabled, sizes are stored in data-sizes
                $attribute = 'sizes';
                if ($dataSizes) $attribute = 'data-sizes';

                // Set tablet breakpoint to 100vw, because stacked means full width
                $stackedSizes = preg_replace(
                    '/\(min-width: 768px\).+/',
                    '(min-width: 768px) 100vw,',
                    $sizes
                );

                $img->setAttribute($attribute, $stackedSizes);
            })
        ;

        // Add class to empty grid columns
        $dom->filter('.ui.grid .column')
            ->each(function(HtmlPageCrawler $column) {
                if($column->getInnerHtml() === '') {
                    $column->addClass('empty');
                }
            })
        ;

        // Transform regular tables into SUI tables
        $dom->filter('table:not(.ui.table)')
            ->addClass('ui table')
        ;

        // Apply Swiper classes to appropriate slide elements
        $dom->filter('.swiper-container')
            ->each(function (HtmlPageCrawler $slider) {
                $slider
                    ->filter('.nested.overview')
                    ->removeClass('stackable')
                    ->removeClass('doubling')
                    ->addClass('swiper-wrapper')
                ;
                $slider
                    ->filter('.gallery')
                    ->addClass('swiper-wrapper')
                ;
                $slider
                    ->filter('.cards')
                    ->addClass('swiper-wrapper')
                ;
                $slider
                    ->filter('.swiper-wrapper > *')
                    ->each(function (HtmlPageCrawler $slide) {
                        if ($slide->hasClass('card')) {
                            $slide
                                ->addClass('ui fluid')
                                ->wrap('<div class="swiper-slide"></div>')
                            ;
                        }
                        elseif ($slide->hasClass('image')) {
                            $slide
                                ->removeClass('content')
                                ->removeClass('rounded')
                                ->addClass('swiper-slide')
                            ;
                        }
                        else {
                            $slide->addClass('swiper-slide');
                        }
                    })
                ;
                // Move prev/next buttons out of container
                // No longer used, but kept here as reference for how to find parent elements
                //$slider->parents()->each(function (HtmlPageCrawler $parent) {
                //    if ($parent->hasClass('nested','slider')) {
                //        $parent->filter('.swiper-button-prev')->appendTo($parent);
                //        $parent->filter('.swiper-button-next')->appendTo($parent);
                //    }
                //});
            })
        ;

        // Fill lightbox with gallery images
        $lightbox = array();
        $lightbox =
            $dom->filter('.gallery.with.lightbox')
                ->each(function (HtmlPageCrawler $gallery) {
                    global $modx;

                    // Grab images sources from data attributes
                    $images =
                        $gallery
                            ->filter('.lightbox > img')
                            ->each(function (HtmlPageCrawler $img) {
                                global $modx;
                                return $modx->getChunk('galleryRowImageLightbox', array(
                                    'src' => $img->attr('data-lightbox-img'),
                                    'caption' => $img->attr('data-caption'),
                                    'title' => $img->attr('alt'),
                                    'classes' => 'swiper-slide',
                                ));
                            })
                    ;

                    // Create lightbox for each gallery
                    return $modx->getChunk('lightboxOuter', array(
                        'uid' => $gallery->attr('data-uid'),
                        'output' => implode($images),
                    ));
                })
        ;

        // Add lightbox to HTML
        $dom->filter('#footer')
            ->after(implode($lightbox))
        ;

        // Disable steps following an active step
        $dom->filter('.ui.consecutive.steps .active.step')
            ->each(function (HtmlPageCrawler $step) {
                $step
                    ->nextAll()
                    ->addClass('disabled')
                ;
            })
        ;
        // Mark previous steps as completed
        $dom->filter('.ui.completable.steps .active.step')
            ->each(function (HtmlPageCrawler $step) {
                $step
                    ->previousAll()
                    ->addClass('completed')
                ;
            })
        ;

        // Fix ID conflicts in project hub
        $dom->filter('#hub .pattern.segment#content')->setAttribute('id','content-global');
        $dom->filter('#hub .pattern.segment#css')->setAttribute('id','css-global');
        $dom->filter('#hub .pattern.segment#footer')->setAttribute('id','footer-global');
        $dom->filter('#hub .pattern.segment#head')->setAttribute('id','head-global');
        $dom->filter('#hub .pattern.segment#script')->setAttribute('id','script-global');

        // Change links to fixed IDs
        $dom->filter('#hub .pattern.segment .list a.item')
            ->each(function (HtmlPageCrawler $link) {
                $href = $link->getAttribute('href');
                switch ($href) {
                    case ($href == 'patterns/organisms#content'):
                    case ($href == 'patterns/organisms#css'):
                    case ($href == 'patterns/organisms#footer'):
                    case ($href == 'patterns/organisms#head'):
                    case ($href == 'patterns/organisms#script'):
                        $link->setAttribute('href', $href . '-global');
                        break;
                }
            })
        ;

        // Save manipulated DOM
        $output = $dom->saveHTML();

        break;
}