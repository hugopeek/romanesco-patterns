<?php
/**
 * This script generates a list of elements whom are not yet present in the
 * Backyard area.
 */

// Get pattern library config file
$jsonArray = json_decode(file_get_contents('config.json'), true);

// Location of Backyard resources
$backyardPath = '/home/hugo/Localhost/packages/romanesco-backyard/core/components/romanescobackyard/resources/05_pages/hub/patterns';

// Function to look for a key in a multi level array
if (!function_exists('recursive_array_search')) {
    function recursive_array_search(array $array, $needle) {
        $result = array();
        $iterator  = new RecursiveArrayIterator($array);
        $recursive = new RecursiveIteratorIterator(
            $iterator,
            RecursiveIteratorIterator::SELF_FIRST
        );
        foreach ($recursive as $key => $value) {
            if ($key === $needle) {
                $result[] = $value;
            }
        }
        return $result;
    }
}

// Weed out categories and project name
unset($jsonArray['package']['elements']['categories']);
unset($jsonArray['name']);

// Create new array with all element names
$elements = recursive_array_search($jsonArray, 'name');

//print_r($jsonArray);

// Prevent false positives on property names
$properties = recursive_array_search($jsonArray, 'properties');
$propertyNames = recursive_array_search($properties, 'name');

$elements = array_diff($elements,$propertyNames);

//print_r($propertyNames);
//print_r($elements);

// Reformat to match their references in HTML
$elementsHTML = array();
foreach ($elements as $element) {
    $elementsHTML[] = 'pattern_name=`' . $element . '`';
}

//print_r($elementsHTML);

// Look for elements inside the Backyard HTML files
$pattern = implode('\|', $elementsHTML) ;
$command = "grep -r '$pattern' $backyardPath";
$matchingFiles = array();
$matchingElements = array();

// Create list of matching files
exec($command, $matchingFiles);

//print_r($matchingFiles);

// Create list of matching elements
foreach ($matchingFiles as $match) {
    preg_match('/\`(.*?)\`/', $match, $matches);
    $matchingElements[] = $matches['1'];
}

// Remove duplicates
$matchingElements = array_keys(array_flip($matchingElements));
//$matchingElements = array_unique($matchingElements);

//print_r($matchingElements);

$missingElements = array_diff($elements,$matchingElements);

$i = 1;
$output = array();
foreach ($missingElements as $element) {
    $output[] = $i++ . '. ' . $element;
}

echo implode("\n",$output);

return;
