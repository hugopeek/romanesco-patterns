<?php
/**
 * ProcessMarkdown
 *
 * Retain original Markdown markup by setting the proper MIME type for a
 * Markdown resource. Set the MIME type back to HTML when viewing the resource
 * in the browser, to prevent the page from being downloaded as file.
 *
 * In addition, HtmlPageDom is used to optimize the output in order to receive
 * the correct styling from Semantic UI.
 *
 * For rendering Markdown as HTML, install the Markdown extra from modstore.pro:
 * https://modstore.pro/packages/content/markdown
 *
 * Process markdown in your template like this:
 *
 * [[*content:Markdown]]
 *
 * @var modX $modx
 * @var array $scriptProperties
 *
 * @package romanesco
 */

if (!class_exists(\Wa72\HtmlPageDom\HtmlPageCrawler::class)) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[HtmlPageDom] Class not found!');
    return;
}

use \Wa72\HtmlPageDom\HtmlPageCrawler;

switch ($modx->event->name) {
    // Set content type to Markdown when resource has a markdown template
    case 'OnBeforeDocFormSave':
        /**
         * @var modResource $resource
         */

        $template = $modx->getObject('modTemplate', array('id' => $resource->get('template')));

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
    // Based on: https://github.com/GoldCoastMedia/modx-xhtml-mime-switch
    case 'OnLoadWebDocument':
        $resource = &$modx->resource;

        // Make sure its Markdown
        if ($resource->get('content_type') !== 11) {
            break;
        }

        // Switch back to HTML
        $resource->ContentType->set('mime_type', 'text/html');
        break;

    // Process output with HtmlPageDom
    case 'OnWebPagePrerender':
        // Make sure its Markdown
        if ($modx->resource->get('content_type') !== 11) {
            break;
        }

        $output = &$modx->resource->_output;
        $dom = new HtmlPageCrawler($output);

        $dom->filter('img')
            ->each(function (HtmlPageCrawler $image)
            {
                // Prevent images from overflowing their container
                $image->addClass('ui rounded raised image');
            })
        ;

        $dom->filter('#markdown a')
            ->each(function (HtmlPageCrawler $link)
            {
                // Turn into button if desired
                if (str_contains($link, 'Continue to:')) {
                    $link->addClass('ui big primary button');
                }
            })
        ;

        // Turn tables into Semantic tables (if needed)
        $dom->filter('#markdown table:not(.ui.table)')->addClass('ui table');

        // Add language class to code blocks that do not specify a language
        $dom->filter('pre')->addClass('language-html');
        $dom->filter('code')
            ->addClass('language-html')
            ->each(function (HtmlPageCrawler $code)
            {
                // Code snippets in markdown files are rendered by MODX.
                // To prevent this, you can add a space to all outer tags in
                //  your markdown file. So [[snippet]] becomes [ [snippet] ].
                // Annoying, but the easiest way around it.
                // At least we can revert it here again:
                $output = str_replace('[ [','[[',$code);
                $output = str_replace('] ]',']]',$output);
                $code->replaceWith($output);
            })
        ;

        // Prettier HR
        $dom->filter('#markdown hr')->replaceWith('<div class="ui divider"></div>');

        // Add SUI list class, but only to first level
        $dom->filter('#markdown ul > li > ul')->addClass('nested');
        $dom->filter('#markdown ul:not(.nested)')->addClass('ui list');
        $dom->filter('#markdown ol > li > ol')->addClass('nested');
        $dom->filter('#markdown ol:not(.nested)')->addClass('ui list');

        $output = $dom->saveHTML();

        break;
}