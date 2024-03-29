<?php
/**
 * getElementDescription
 *
 * Retrieve the description of common database objects.
 *
 * You can retrieve another field or property value by specifying either the
 * 'field' or 'property' parameter.
 *
 * @var modX $modx
 * @var array $scriptProperties
 */

$elementType = $modx->getOption('type', $scriptProperties, '');
$elementName = $modx->getOption('name', $scriptProperties, '');
$fieldName = $modx->getOption('field', $scriptProperties, 'description');
$property = $modx->getOption('property', $scriptProperties, '');

// Set correct database table information based on the element type
switch($elementType) {
    case stripos($elementType, 'electrontv') !== false:
        $dbTable = "site_tmplvars";
        $dbNameField = "name";
        $modxObject = "modTemplateVar";
        break;
    case stripos($elementType, 'atom') !== false:
    case stripos($elementType, 'molecule') !== false:
    case stripos($elementType,'organism') !== false:
        $dbTable = "site_htmlsnippets";
        $dbNameField = "name";
        $modxObject = "modChunk";
        break;
    case stripos($elementType, 'template') !== false:
        $dbTable = "site_templates";
        $dbNameField = "templatename";
        $modxObject = "modTemplate";
        break;
    case stripos($elementType, 'page') !== false:
        $dbTable = "site_content";
        $dbNameField = "pagetitle";
        $modxObject = "modResource";
        break;
    case stripos($elementType, 'formula') !== false:
        $dbTable = "site_snippets";
        $dbNameField = "name";
        $modxObject = "modSnippet";
        break;
    case stripos($elementType, 'computation') !== false:
        $dbTable = "site_plugins";
        $dbNameField = "name";
        $modxObject = "modPlugin";
        break;
    case stripos($elementType, 'bosonfield') !== false:
        $dbTable = "contentblocks_field";
        $dbNameField = "name";
        $modxObject = "cbField";
        break;
    case stripos($elementType, 'bosonlayout') !== false:
        $dbTable = "contentblocks_layout";
        $dbNameField = "name";
        $modxObject = "cbLayout";
        break;
    case stripos($elementType, 'bosontemplate') !== false:
        $dbTable = "contentblocks_template";
        $dbNameField = "name";
        $modxObject = "cbTemplate";
        break;
    default:
        $dbTable = "";
        $dbNameField = "";
        $modxObject = "";
        break;
}

// In case we are dealing with a ContentBlocks element, load CB service
if (stripos($dbTable, 'contentblocks')) {
    $cbCorePath = $modx->getOption('contentblocks.core_path', null, $modx->getOption('core_path').'components/contentblocks/');
    $ContentBlocks = $modx->getService('contentblocks','ContentBlocks', $cbCorePath.'model/contentblocks/');
}

// User can opt to select another field or a property value instead
if ($property) {
    $fieldName = 'properties';
}

// Prepare db query and retrieve value
if ($modxObject) {
    $query = $modx->newQuery($modxObject, array(
        $dbNameField => $elementName
    ));
    $query->select($fieldName);
    $output = $modx->getValue($query->prepare());

    // Properties need to be unserialized first
    if ($property) {
        $properties = unserialize($output, ['allowed_classes' => false]);
        $output = $properties[$property]['value'] ?? '';
    }

    return $output;
} else {
    $modx->log(modX::LOG_LEVEL_ERROR, '[getElementDescription] ' . $elementName . ' could not be processed');
    return '';
}