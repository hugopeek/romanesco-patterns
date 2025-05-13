<?php
/**
 *
 */

// Use external library for validating JSON
require_once '../core/components/romanesco/vendor/autoload.php';

use Seld\JsonLint\JsonParser;
use Symfony\Component\Yaml\Yaml;

$parser = new JsonParser();

// Get all JSON files from src folder
$sources = glob("{src/*.json,src/*/*.json,src/*/*/*.json}", GLOB_BRACE);

// Get template lists for linking TV assignments in bulk
$templateList = glob("{src_snippets/*}", GLOB_BRACE);

// Set base of config file
$baseArray = json_decode(file_get_contents('src/base.json'), TRUE);
$sourceArray = array();

foreach ($sources as $index => $source) {
    $json = file_get_contents($source);
    $validateSource = $parser->lint($json);

    // Check if file content is valid JSON
    if ($validateSource) {
        echo $validateSource . "\n";
        echo "Source: $source \n";
        echo "Validation failed. \n";
        return false;
    }

    // Skip base file
    if (strpos($source, 'base.json')) {
        continue;
    }

    // Decode file as an associative array
    $sourceArray = json_decode($json, 1);

    // Append this data to the main array on each loop
    $baseArray = array_merge_recursive($baseArray,$sourceArray);
}

// Back to JSON
$output = json_encode($baseArray, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);

// Fill placeholders with corresponding template names
foreach ($templateList as $file) {
    $list = file_get_contents($file);
    $list = str_replace(array("\r", "\n"), '', $list);
    $filename = pathinfo($file)['filename'];

    // Insert list wherever filename matches an @@template_list value
    $output = str_replace('@@' . $filename, $list, $output);
}

// Validate output one more time
$validateOutput = $parser->lint($output);
if ($validateOutput) {
    echo $validateOutput . "\n";
    echo "Validation of merged JSON failed.";
    return false;
} else {
    echo "Config file is valid JSON. \n";
}

// Write config file for MODX 2.x
file_put_contents("config.json", $output);
echo "Config file for 2.x successfully built.\n";

// Back to array, so we can convert this output for MODX 3.x
$data = json_decode($output, true);

// Move the contents of "package" and "elements" to the root
$elementsData = $data['package']['elements'] ?? [];
$settingsData = $data['package']['systemSettings'] ?? [];
unset($data['package']);
unset($data['actions']);
unset($data['resources']);
$data = array_merge($data, $elementsData);
$data['systemSettings'] = $settingsData;

// Remove 2.x categories with parent references
$i = 0;
foreach ($data['categories'] as $category) {
    if (array_key_exists('parent', $category)) {
        unset($data['categories'][$i]);
    }
    $i++;
}

// Change renamed array keys
function changeKeyRecursive(array $array, $oldKey, $newKey): array
{
    foreach ($array as $key => $value) {
        if (is_array($value)) {
            $array[$key] = changeKeyRecursive($value, $oldKey, $newKey);
        }
        if ($key === $oldKey) {
            $array[$newKey] = $array[$oldKey];
            unset($array[$oldKey]);
        }
    }
    return $array;
}
$data['tvs'] = changeKeyRecursive($data['tvs'], 'inputProperties', 'inputOptions');
$data['tvs'] = changeKeyRecursive($data['tvs'], 'outputProperties', 'outputOptions');
$data['tvs'] = changeKeyRecursive($data['tvs'], 'display', 'outputType');
$data['plugins'] = changeKeyRecursive($data['plugins'], 'event', 'name');
$data['plugins'] = changeKeyRecursive($data['plugins'], 'priority', 'flip');
$data['plugins'] = changeKeyRecursive($data['plugins'], 'flip', 'priority');

// Rearrange TV properties
foreach ($data['tvs'] as &$tv) {
    // Move name to start of array
    if (array_key_exists('name', $tv)) {
        $name = ['name' => $tv['name']];
        unset($tv['name']);
        $tv = $name + $tv;
    }
    // Move templates to end of array
    if (array_key_exists('templates', $tv)) {
        $templateList = $tv['templates'];
        unset($tv['templates']);
        $tv['templates'] = $templateList;
    }
}

// Convert the PHP array to YAML
$yaml = Yaml::dump($data, 8, 2, Yaml::DUMP_MULTI_LINE_LITERAL_BLOCK);
$yaml = preg_replace('/-\s+name:/', '- name:', $yaml);
$yaml = preg_replace('/-\s+key:/', '- key:', $yaml);

// Compare altered Yaml with original array
try {
    Yaml::parse($yaml);
    echo "Config file is valid Yaml.\n";
} catch (\Exception $e) {
    echo $e->getMessage();
    return false;
}

// Write config file for MODX 3.x
//file_put_contents("gpm.json", json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES));
file_put_contents("gpm.yaml", $yaml);
echo "Config file for 3.x successfully built.\n";

return;
