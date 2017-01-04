<?php
/**
 * includedSnippets
 *
 * This snippet is intended to list the snippets that are being called
 * inside a given chunk. It needs the raw content of the chunk as input.
 *
 * See includedChunks for more detailed instructions.
 *
 * @author Hugo Peek
 */

$string = $input;
$tpl = $modx->getOption('tpl', $scriptProperties, 'includedPatternsRow');

// Create a list with all available snippets
$snippetList = $modx->runSnippet('Rowboat', (array(
    'table' => 'modx_site_snippets',
    'tpl' => 'rawName',
    'limit' => '0',
    'columns' => '{ "name":"" }',
    'outputSeparator' => '|'
)
));

// Find included snippets by comparing them to the list
$regex = '"(' . $snippetList . ')"';

if (preg_match_all($regex, $string, $matches)) {
    foreach ($matches as $snippet) {
        $match = $snippet;
    }

    // Remove duplicates
    $result = array_unique($match);

    // Process matches individually
    foreach ($result as $name) {
        // Also fetch category, to help ensure the correct resource is being linked
        $query = $modx->newQuery('modSnippet', array(
            'name' => $name
        ));
        $query->select('category');
        $category = $modx->getValue($query->prepare());

        // Output to a chunk that contains the link generator
        $output[] = $modx->getChunk($tpl, array(
            'name' => $name,
            'category' => $category
        ));
    }
}

return implode($output);