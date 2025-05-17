<?php
/**
 * renderInputOption
 *
 * Fetch option name from the romanesco_options table (when used as output
 * modifier). You can also get other available fields with a regular snippet
 * call and tpl chunk.
 *
 * Use as output modifier:
 *
 * [[+status_progress:renderInputOption]]
 *
 * Choose whether to match by something other than the default ID:
 *
 * [[+status_progress:renderInputOption=`alias`]]
 *
 * Use as regular snippet, with tpl and key to restrict search results by:
 *
 * [[renderInputOption?
 *     &value=`[[+status_progress]]`
 *     &match=`alias`
 *     &key=`status_progress`
 *     &tpl=`tagItemTooltip`
 * ]]
 *
 * Available fields in tpl:
 *
 * [[+id]]
 * [[+name]]
 * [[+alias]]
 * [[+description]]
 * [[+parent]]
 * [[+key]]
 * [[+position]]
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @var string $input
 * @var string $options
 */

$value = $modx->getOption('value', $scriptProperties, $input);
$match = $modx->getOption('match', $scriptProperties, $options);
$key = $modx->getOption('key', $scriptProperties, '');
$select = $modx->getOption('select', $scriptProperties, 'name');
$tpl = $modx->getOption('tpl', $scriptProperties, '');
$outputSeparator = $modx->getOption('outputSeparator', $scriptProperties, '');

if (!function_exists('getInputOption')) {
    function getInputOption($value,$match,$key,$select,$tpl){
        global $modx;

        $inputOption = $modx->getObject('FractalFarming\Romanesco\Model\rmOption', array(
            $match => $value,
            'key' => $key,
        ));
        $outputFields = array(
            'id' => $inputOption->get('id'),
            'name' => $inputOption->get('name'),
            'title' => $inputOption->get('name'),
            'tag' => $inputOption->get('name'),
            'alias' => $inputOption->get('alias'),
            'description' => $inputOption->get('description'),
            'parent' => $inputOption->get('parent'),
            'group' => $inputOption->get('parent'),
            'key' => $inputOption->get('key'),
            'position' => $inputOption->get('position'),
        );

        if ($tpl) {
            $output = $modx->getChunk($tpl, $outputFields);
        } else {
            $output = $inputOption->get($select);
        }

        return $output;
    }
}

if ($value == '') { return ''; }

$output = [];

// Find matching ID by default
if (!$match) { $match = 'id'; }

// Don't fetch entire object if it's being used as output modifier
if ($input) {
    $query = $modx->newQuery('FractalFarming\Romanesco\Model\rmOption');
    $query->where(array(
        $match => $value,
    ));
    $query->select($select);

    return $modx->getValue($query->prepare());
}

// Value can be an array as well
else if (strpos($value,',')) {
    $values = explode(',',$value);

    foreach ($values as $value) {
        $output[] = getInputOption($value,$match,$key,$select,$tpl);
    }
    return implode($outputSeparator,$output);
}

else {
    return getInputOption($value,$match,$key,$select,$tpl);
}