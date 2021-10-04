<?php
/**
 * loadAssets
 *
 * Generic asset loader. Needs component value to decide which assets to load.
 *
 * @var modX $modx
 * @var array $scriptProperties
 *
 * @package romanesco
 */

$corePath = $modx->getOption('romanescobackyard.core_path', null, $modx->getOption('core_path') . 'components/romanescobackyard/');
$romanesco = $modx->getService('romanesco','Romanesco',$corePath . 'model/romanescobackyard/',array('core_path' => $corePath));
if (!($romanesco instanceof Romanesco)) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[Romanesco] Class not found!');
    return;
}

$assetsPathCSS = $modx->getOption('romanesco.semantic_css_path', $scriptProperties, '');
$assetsPathJS = $modx->getOption('romanesco.semantic_js_path', $scriptProperties, '');
$assetsPathVendor = $modx->getOption('romanesco.semantic_vendor_path', $scriptProperties, '');
$assetsPathDist = $modx->getOption('romanesco.semantic_dist_path', $scriptProperties, '');

// Which component are we loading assets for
$component = $modx->getOption('component', $scriptProperties, '');
if (!$component) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[loadAssets] Component not defined!');
    return;
}

// Load strings to insert in asset paths when cache busting is enabled
$cacheBusterCSS = $romanesco->getCacheBustingString('CSS');
$cacheBusterJS = $romanesco->getCacheBustingString('JS');

// Check if minify assets setting is activated in Configuration
$minify = '';
if ($modx->getObject('cgSetting', array('key' => 'minify_css_js'))->get('value') == 1) {
    $minify = '.min';
}

// Load component asynchronously if critical CSS is enabled
$async = '';
if ($romanesco->getConfigSetting('critical_css', $modx->resource->get('context_key'))) {
    $async = ' media="print" onload="this.media=\'all\'"';
}

switch ($component) {
    case 'hub':
    case 'status grid':
    case 'status-grid':
        $modx->regClientStartupHTMLBlock('<link href="' . $assetsPathDist . '/components/table.min' . $cacheBusterCSS . '.css" rel="stylesheet" type="text/css"' . $async . '>');
        $modx->regClientStartupHTMLBlock('<link href="' . $assetsPathDist . '/components/step.min' . $cacheBusterCSS . '.css" rel="stylesheet" type="text/css"' . $async . '>');
        $modx->regClientStartupHTMLBlock('<link href="' . $assetsPathDist . '/components/dimmer.min' . $cacheBusterCSS . '.css" rel="stylesheet" type="text/css"' . $async . '>');
        $modx->regClientStartupHTMLBlock('<link href="' . $assetsPathDist . '/components/modal.min' . $cacheBusterCSS . '.css" rel="stylesheet" type="text/css"' . $async . '>');
        $modx->regClientHTMLBlock('<script defer src="' . $assetsPathDist . '/components/dimmer.min' . $cacheBusterJS . '.js"></script>');
        $modx->regClientHTMLBlock('<script defer src="' . $assetsPathDist . '/components/modal.min' . $cacheBusterJS . '.js"></script>');
        $modx->regClientHTMLBlock('<script defer src="' . $assetsPathVendor . '/tablesort/tablesort.min' . $cacheBusterJS . '.js"></script>');
        $modx->regClientHTMLBlock('<script defer src="' . $assetsPathJS . '/hub' . $minify . $cacheBusterJS . '.js"></script>');
    break;
    case 'table':
        $modx->regClientStartupHTMLBlock('<link href="' . $assetsPathDist . '/components/table.min' . $cacheBusterCSS . '.css" rel="stylesheet" type="text/css"' . $async . '>');
        $modx->regClientHTMLBlock('<script defer src="' . $assetsPathVendor . '/tablesort/tablesort.min' . $cacheBusterJS . '.js"></script>');
        break;
    case 'step':
    case 'steps':
        $modx->regClientStartupHTMLBlock('<link href="' . $assetsPathDist . '/components/step.min' . $cacheBusterCSS . '.css" rel="stylesheet" type="text/css"' . $async . '>');
        break;
    case 'modal':
        $modx->regClientStartupHTMLBlock('<link href="' . $assetsPathDist . '/components/dimmer.min' . $cacheBusterCSS . '.css" rel="stylesheet" type="text/css"' . $async . '>');
        $modx->regClientStartupHTMLBlock('<link href="' . $assetsPathDist . '/components/modal.min' . $cacheBusterCSS . '.css" rel="stylesheet" type="text/css"' . $async . '>');
        $modx->regClientHTMLBlock('<script defer src="' . $assetsPathDist . '/components/dimmer.min' . $cacheBusterJS . '.js"></script>');
        $modx->regClientHTMLBlock('<script defer src="' . $assetsPathDist . '/components/modal.min' . $cacheBusterJS . '.js"></script>');
        break;
    case 'dimmer':
        $modx->regClientStartupHTMLBlock('<link href="' . $assetsPathDist . '/components/dimmer.min' . $cacheBusterCSS . '.css" rel="stylesheet" type="text/css"' . $async . '>');
        $modx->regClientHTMLBlock('<script defer src="' . $assetsPathDist . '/components/dimmer.min' . $cacheBusterJS . '.js"></script>');
        $modx->regClientHTMLBlock('<script defer src="' . $assetsPathJS . '/dimmer'. $minify . $cacheBusterJS . '.js"></script>');
        break;
    case 'syntax-highlighting':
        $modx->regClientStartupHTMLBlock('<link href="' . $assetsPathVendor . '/prism/prism.min' . $cacheBusterCSS . '.css" rel="stylesheet" type="text/css"' . $async . '>');
        $modx->regClientHTMLBlock('<script defer src="' . $assetsPathVendor . '/prism/prism.min' . $cacheBusterJS . '.js"></script>');
        break;
    case 'map':
        $modx->regClientStartupHTMLBlock('<link href="' .
            $modx->getOption('romanesco.leaflet_css_url', $scriptProperties, '') .
            '" integrity="' . $modx->getOption('romanesco.leaflet_css_integrity', $scriptProperties, '') .
            '" crossorigin="" ' . $async . '>');
        // JS is added to the HEAD of the page (without defer), so maps can be initialized from content area.
        $modx->regClientStartupHTMLBlock('<script src="' .
            $modx->getOption('romanesco.leaflet_js_url', $scriptProperties, '') .
            '" integrity="' . $modx->getOption('romanesco.leaflet_js_integrity', $scriptProperties, '') .
            '" crossorigin=""></script>');
        break;
}

return '';