<?php
/**
 * setBoxType
 *
 * This snippet is used by PatternLab to set the appropriate classes for all Overview containers and rows.
 * It was created because the chunks where getting a bit swamped by output modifiers trying to do the same thing.
 *
 * The snippet looks at the chunk name that is set for the Overview being used.
 * If the name matches the case, the placeholders are populated with the values in that case.
 *
 * $box_type - The classes for the container (the overviewOuter chunks, found in Organisms)
 * $row_type - The wrapper chunk for the actual template (useful for managing HTML5 elements or creating link items)
 * $column_type - The class for each individual template (always closely tied to the class of the box_type)
 *
 * Be advised: the cases are read from top to bottom, until it finds a match. This means that all following cases will
 * not be processed, so always place input strings that contain the partial value of another string lower on the list!
 *
 * @author Hugo Peek
 */

$input = $modx->getOption('input', $scriptProperties, '');
$prefix = $modx->getOption('prefix', $scriptProperties, '');

switch($input) {
    case stripos($input,'LinkCard') !== false:
        $box_type = "centered link cards";
        $row_type = "link";
        $column_type = "card";
        break;
    case stripos($input,'Card') !== false:
        $box_type = "centered cards";
        $row_type = "";
        $column_type = "card";
        break;
    case stripos($input,'Segment') !== false:
        $box_type = "segments";
        $row_type = "segment";
        $column_type = "segment";
        break;
    case stripos($input,'Item') !== false:
        $box_type = "items";
        $row_type = "";
        $column_type = "item";
        break;
    case stripos($input,'Compact') !== false:
        $box_type = "middle aligned list";
        $row_type = "";
        $column_type = "item";
        break;
    case stripos($input,'IconTop') !== false:
        $box_type = "centered grid";
        $row_type = "";
        $column_type = "center aligned column";
        break;
    case stripos($input,'Logo') !== false:
        $box_type = "centered middle aligned grid";
        $row_type = "";
        $column_type = "center aligned column logo";
        break;
    case stripos($input,'AssessorBasic') !== false: // @Todo: shouldn't be here, project specific...
        $box_type = "centered cards";
        $row_type = "";
        $column_type = "basic card";
        break;
    case stripos($input,'Assessor') !== false:
        $box_type = "centered cards";
        $row_type = "";
        $column_type = "card";
        break;
    default:
        $box_type = "centered grid";
        $row_type = "";
        $column_type = "column";
        break;
}

$modx->toPlaceholder('box_type', $box_type, $prefix);
$modx->toPlaceholder('row_type', $row_type, $prefix);
$modx->toPlaceholder('column_type', $column_type, $prefix);
$modx->toPlaceholder('prefix', $prefix);