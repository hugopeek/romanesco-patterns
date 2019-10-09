<?php
/**
 * MarkdownMimeType
 *
 * Retain original Markdown markup by setting the proper MIME type for a
 * Markdown resource. Set the MIME type back to HTML when viewing the resource
 * in the browser, to prevent the page from being downloaded as file.
 *
 * In addition, HtmlPageDom is used to fix image URLs and prevent them from
 * overflowing their container.
 *
 * For rendering Markdown as HTML, install the Markdown extra from modstore.pro:
 * https://modstore.pro/packages/content/markdown
 *
 * Process markdown in your template like this:
 *
 * [[*content:Markdown]]
 */

$corePath = $modx->getOption('htmlpagedom.core_path', null, $modx->getOption('core_path') . 'components/htmlpagedom/');

if (!class_exists('\Wa72\HtmlPageDom\HtmlPageCrawler')) {
    require $corePath . 'vendor/autoload.php';
}

use \Wa72\HtmlPageDom\HtmlPageCrawler;

switch ($modx->event->name) {
    // Set content type to Markdown when resource has a markdown template
    case 'OnBeforeDocFormSave':
        $template = $modx->getObject('modTemplate', array('id'=>$resource->get('template')));

        if (!is_object($template)) {
            break;
        }

        // Any template with 'Markdown' in its name qualifies
        // Note to self: you need to revert the content type manually if you assign a non-markdown template again
        if (stripos($template->get('templatename'), 'markdown') !== false) {
            $resource->set('contentType', 'text/x-markdown');
            $resource->set('content_type', '11');

            // Also disable any active text editor
            $resource->set('richtext', 0);
        }

        break;

    // Use HTML mime type when viewed as a web page
    // Inspired by: https://github.com/GoldCoastMedia/modx-xhtml-mime-switch
    case 'OnWebPagePrerender':
        $resource = &$modx->resource;

        // Header content types
        $header = (object) array(
            'markdown'  => 'text/x-markdown',
            'html' => 'text/html',
        );

        // Get the document type
        $markdown = ($resource->get('contentType') === $header->markdown) ? true : false;

        // Switch back to HTML
        if ($markdown) {
            $resource->ContentType->set('mime_type', $header->html);
        } else {
            break;
        }

        // Process output with HtmlPageDom
        $output = &$resource->_output;
        $dom = new HtmlPageCrawler($output);

        // Fix image URLs and display size
        $dom->filter('img')
            ->each(function (HtmlPageCrawler $image) {
                $src = $image->getAttribute('src');
                $image
                    ->setAttribute('src', 'notes/' . $src)
                    ->addClass('ui image')
                ;
            })
        ;

        $output = $dom->saveHTML();

        break;
}