<?php
/**
 * includedChunks
 *
 * This snippet is intended to list the chunks that are being used
 * inside another chunk. It needs the raw content of the chunk as input.
 * A regular chunk call won't work, since the referenced chunks have
 * already been parsed there.
 *
 * You can get the raw input by looking directly in the database table
 * of the chunk, using Rowboat for example:
 *
 * [[!Rowboat:toPlaceholder=`raw_chunk`?
 *     &table=`modx_site_htmlsnippets`
 *     &tpl=`displayRawElement`
 *     &where=`{"name":"overviewRowBasic"}`
 * ]]
 *
 * Then scan the raw input for included chunks like this:
 *
 * [[!includedChunks? &input=`[[+raw_chunk]]`]]
 *
 * If you want to see which chunks have references to a specific chunk
 * (the reverse thing, basically), you can use Rowboat again:
 *
 * [[Rowboat?
 *     &table=`modx_site_htmlsnippets`
 *     &tpl=`includedPatternsRow`
 *     &sortBy=`name`
 *     &where=`{ "snippet:LIKE":"%$buttonHrefOverview%" }`
 * ]]
 *
 * This is not entirely accurate though, since a reference to a chunk
 * called something like 'buttonHrefOverviewBasic' will also be listed
 * in the results.
 *
 * @author Hugo Peek
 */

$string = $input;
$tpl = $modx->getOption('tpl', $scriptProperties, 'includedPatternsRow');

// Find chunk names by their leading $ character
$regex = '/(?<!\w)\$\w+/';

// Set idx start value
$idx = 0;

// Define output array
$output = array();

if (preg_match_all($regex, $string, $matches)) {
    // Remove $ from all matches
    foreach ($matches as $match) {
        $match = str_replace('$', '', $match);
    }

    // Remove duplicates
    $result = array_unique($match);

    // Process matches individually
    foreach ($result as $name) {
        // Also fetch category, to help ensure the correct resource is being linked
        $query = $modx->newQuery('modChunk', array(
            'name' => $name
        ));
        $query->select('category');
        $category = $modx->getValue($query->prepare());

        // Up idx value by 1, so a unique placeholder can be created
        $idx++;

        // Output to a chunk that contains the link generator
        $output[] = $modx->getChunk($tpl, array(
            'name' => $name,
            'category' => $category,
            'idx' => $idx
        ));
    }

    // No idea how it sorts the result, but seems better than the default
    sort($output);
}

return implode($output);