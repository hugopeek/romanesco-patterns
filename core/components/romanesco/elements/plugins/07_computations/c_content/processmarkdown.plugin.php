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

$pdCorePath = $modx->getOption('htmlpagedom.core_path', null, $modx->getOption('core_path') . 'components/htmlpagedom/');

if (!class_exists('\Wa72\HtmlPageDom\HtmlPageCrawler')) {
    require $pdCorePath . 'vendor/autoload.php';
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
    case 'OnWebPagePrerender':
        $resource = &$modx->resource;

        if ($resource->get('content_type') !== 11) {
            break;
        }

        // Header content types
        $header = (object) array(
            'markdown'  => 'text/x-markdown',
            'html' => 'text/html',
        );

        // Get the document type
        $markdown = $resource->get('contentType') === $header->markdown;

        // Switch back to HTML
        if ($markdown) {
            $resource->ContentType->set('mime_type', $header->html);
        }

        // Process output with HtmlPageDom
        $output = &$resource->_output;
        $dom = new HtmlPageCrawler($output);

        // Fix image URLs and prevent them from overflowing their container
        $dom->filter('img')
            ->each(function (HtmlPageCrawler $image) {
                $src = $image->getAttribute('src');
                $image
                    ->setAttribute('src', 'notes/' . $src)
                    ->addClass('ui image')
                ;
            })
        ;

        // Remove .md extension from links
        $dom->filter('a')
            ->each(function (HtmlPageCrawler $link) {
                $href = $link->getAttribute('href');
                $link->setAttribute('href', str_replace('.md','',$href));

                // Turn into button if desired
                if (strpos($link,'Continue to:') !== false) {
                    $link->addClass('ui big primary button');
                }
            })
        ;

        // Turn tables into Semantic tables
        $dom->filter('table')->addClass('ui compact table');

        // Add language class to code blocks that do not specify a language
        $dom->filter('pre')->addClass('language-html');
        $dom->filter('code')
            ->addClass('language-html')
            ->each(function (HtmlPageCrawler $code) {

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

        // And a few other things
        $dom->filter('hr')->replaceWith('<div class="ui divider"></div>');
        //$dom->filter('ul')->addClass('ui list');
        //$dom->filter('ol')->addClass('ui list');

        $output = $dom->saveHTML();

        break;
}