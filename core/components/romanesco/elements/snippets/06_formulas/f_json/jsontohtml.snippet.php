<?php
// @todo: write documentation and use chunks for the HTML templating

$json = $modx->getOption('json', $scriptProperties, '');
//$filterKeys = $modx->getOption('filterKeys', $scriptProperties, 'template,process_tags,field_is_exposed');
//$filterKeys = $modx->getOption('filterKeys', $scriptProperties, '"template","process_tags","field_is_exposed"');

if (!$json) return '';

$jsonArray = json_decode($json, true);
//$filterArray = explode(',', $filterKeys);

if (!function_exists('jsonToHTML')) {
    function jsonToHTML($array = array(), $tdClass = 'top level') {
        $output = '<table class="ui compact very basic table"><tbody>';

        $filterKeys = array("templates","process_tags","field_is_exposed");

        foreach ($array as $key => $value) {
            if ($value == 'icon_class') break;

            // Exclude unwanted keys and keys with an empty value from result
            // When not set to 'true', the first item in the array will always be excluded
            if (in_array($key, $filterKeys, true) == false && $value != false) {
                $output .= "<tr class='top aligned'>";
                $output .= "<td class='$tdClass'><strong>$key</strong></td>";
                $output .= "<td>";
                if (is_array($value)) {
                    $output .= jsonToHTML($value, 'five wide');
                } else {
                    $output .= $value;
                }
                $output .= "</td></tr>";
            }
        }

        $output .= "</tbody></table>";

        return $output;
    }
}

return (jsonToHTML($jsonArray));