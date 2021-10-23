<?php
/**
 * loadAssets
 *
 * Generic asset loader. Needs a component value to decide which assets to load.
 *
 * The MODX regClient functions will automatically filter duplicate statements,
 * so you don't need to worry about an element being loaded more than once (as
 * opposed to putting the link / script in your templates).
 *
 * External javascript sources are loaded with defer, to keep their loading
 * sequence intact (based on position in HTML). CSS is loaded asynchronously if
 * it's not directly affecting page styling (modals for example) and if
 * critical CSS is enabled.
 *
 * Cache busting and minification is also taken care of. The biggest limitation
 * is that you can only add one component at the time.
 *
 * You can add custom CSS or JS by defining a custom component:
 *
 * [[loadAssets?
 *     &component=`custom`
 *     &css=`[[++romanesco.custom_css_path]]/custom[[+minify]][[+cache_buster_css]].css`
 *     &js=`[[++romanesco.custom_js_path]]/custom[[+minify]][[+cache_buster_js]].js`
 *     &inlineJS=`
 *         <script>
 *         window.addEventListener('DOMContentLoaded', function() {
 *             console.log('Something very custom');
 *         });
 *         </script>
 *     `
 * ]]
 *
 * This does support multiple CSS and JS references. Just add them in a valid
 * JSON array:
 *
 * [[loadAssets?
 *     &component=`custom`
 *     &css=`[
 *         "[[++romanesco.custom_css_path]]/custom1[[+minify]][[+cache_buster_css:empty=``]].css",
 *         "[[++romanesco.custom_css_path]]/custom2[[+minify]][[+cache_buster_css:empty=``]].css"
 *     ]`
 * ]]
 *
 * You can prevent asynchronous loading of custom CSS with &cssAsync=`0`.
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

// Custom components bring their own CSS or JS
$customCSS = $modx->getOption('css', $scriptProperties, '');
$customJS = $modx->getOption('js', $scriptProperties, '');
$customInlineJS = $modx->getOption('inlineJS', $scriptProperties, '');

// Load strings to insert in asset paths when cache busting is enabled
$cacheBusterCSS = $romanesco->getCacheBustingString('CSS');
$cacheBusterJS = $romanesco->getCacheBustingString('JS');

// Check if minify assets setting is activated in Configuration
$minify = '';
if ($modx->getObject('cgSetting', array('key' => 'minify_css_js'))->get('value') == 1) {
    $minify = '.min';
}

// Define conditions for loading CSS asynchronously
$async = array(
    'always' => ' media="print" onload="this.media=\'all\'"',
    'critical' => '',
    'custom' => '',
);
if ($romanesco->getConfigSetting('critical_css', $modx->resource->get('context_key'))) {
    $async['critical'] = $async['always'];
}
if ($modx->getOption('cssAsync', $scriptProperties, 1)) {
    $async['custom'] = $async['always'];
}

switch ($component) {
    case 'hub':
    case 'status grid':
    case 'status-grid':
        $modx->regClientStartupHTMLBlock('<link href="' . $assetsPathDist . '/components/table.min' . $cacheBusterCSS . '.css" rel="stylesheet" type="text/css"' . $async['critical'] . '>');
        $modx->regClientStartupHTMLBlock('<link href="' . $assetsPathDist . '/components/step.min' . $cacheBusterCSS . '.css" rel="stylesheet" type="text/css"' . $async['critical'] . '>');
        $modx->regClientStartupHTMLBlock('<link href="' . $assetsPathDist . '/components/dimmer.min' . $cacheBusterCSS . '.css" rel="stylesheet" type="text/css"' . $async['always'] . '>');
        $modx->regClientStartupHTMLBlock('<link href="' . $assetsPathDist . '/components/modal.min' . $cacheBusterCSS . '.css" rel="stylesheet" type="text/css"' . $async['always'] . '>');
        $modx->regClientHTMLBlock('<script defer src="' . $assetsPathDist . '/components/dimmer.min' . $cacheBusterJS . '.js"></script>');
        $modx->regClientHTMLBlock('<script defer src="' . $assetsPathDist . '/components/modal.min' . $cacheBusterJS . '.js"></script>');
        $modx->regClientHTMLBlock('<script defer src="' . $assetsPathVendor . '/tablesort/tablesort.min' . $cacheBusterJS . '.js"></script>');
        $modx->regClientHTMLBlock('<script defer src="' . $assetsPathJS . '/hub' . $minify . $cacheBusterJS . '.js"></script>');
        break;
    case 'table':
        $modx->regClientStartupHTMLBlock('<link href="' . $assetsPathDist . '/components/table.min' . $cacheBusterCSS . '.css" rel="stylesheet" type="text/css"' . $async['critical'] . '>');
        $modx->regClientHTMLBlock('<script defer src="' . $assetsPathVendor . '/tablesort/tablesort.min' . $cacheBusterJS . '.js"></script>');
        break;
    case 'step':
    case 'steps':
        $modx->regClientStartupHTMLBlock('<link href="' . $assetsPathDist . '/components/step.min' . $cacheBusterCSS . '.css" rel="stylesheet" type="text/css"' . $async['critical'] . '>');
        break;
    case 'modal':
        $modx->regClientStartupHTMLBlock('<link href="' . $assetsPathDist . '/components/dimmer.min' . $cacheBusterCSS . '.css" rel="stylesheet" type="text/css"' . $async['always'] . '>');
        $modx->regClientStartupHTMLBlock('<link href="' . $assetsPathDist . '/components/modal.min' . $cacheBusterCSS . '.css" rel="stylesheet" type="text/css"' . $async['always'] . '>');
        $modx->regClientHTMLBlock('<script defer src="' . $assetsPathDist . '/components/dimmer.min' . $cacheBusterJS . '.js"></script>');
        $modx->regClientHTMLBlock('<script defer src="' . $assetsPathDist . '/components/modal.min' . $cacheBusterJS . '.js"></script>');
        break;
    case 'dimmer':
        $modx->regClientStartupHTMLBlock('<link href="' . $assetsPathDist . '/components/dimmer.min' . $cacheBusterCSS . '.css" rel="stylesheet" type="text/css"' . $async['always'] . '>');
        $modx->regClientHTMLBlock('<script defer src="' . $assetsPathDist . '/components/dimmer.min' . $cacheBusterJS . '.js"></script>');
        $modx->regClientHTMLBlock('<script defer src="' . $assetsPathJS . '/dimmer'. $minify . $cacheBusterJS . '.js"></script>');
        break;
    case 'syntax-highlighting':
        $modx->regClientStartupHTMLBlock('<link href="' . $assetsPathVendor . '/prism/prism.min' . $cacheBusterCSS . '.css" rel="stylesheet" type="text/css"' . $async['critical'] . '>');
        $modx->regClientHTMLBlock('<script defer src="' . $assetsPathVendor . '/prism/prism.min' . $cacheBusterJS . '.js"></script>');
        break;
    case 'map':
        $modx->regClientStartupHTMLBlock(
            '<link rel="stylesheet" href="' . $modx->getOption('romanesco.leaflet_css_url', $scriptProperties, '') .
            '" integrity="' . $modx->getOption('romanesco.leaflet_css_integrity', $scriptProperties, '') .
            '" crossorigin="">'
        );
        $modx->regClientStartupHTMLBlock(
            '<script defer src="' . $modx->getOption('romanesco.leaflet_js_url', $scriptProperties, '') .
            '" integrity="' . $modx->getOption('romanesco.leaflet_js_integrity', $scriptProperties, '') .
            '" crossorigin=""></script>'
        );
    case 'custom':
        if (!function_exists('is_json')) {
            function is_json($string) {
                json_decode($string);
                return json_last_error() === JSON_ERROR_NONE;
            }
        }
        if ($customCSS) {
            if (is_json($customCSS)) {
                $customCSS = json_decode($customCSS, true);
                foreach ($customCSS as $CSS) {
                    $modx->regClientStartupHTMLBlock('<link href="' . $CSS . '" rel="stylesheet" type="text/css"' . $async['custom'] . '>');
                }
            } else {
                $modx->regClientStartupHTMLBlock('<link href="' . $customCSS . '" rel="stylesheet" type="text/css"' . $async['custom'] . '>');
            }
        }
        if ($customJS) {
            if (is_json($customJS)) {
                $customJS = json_decode($customJS, true);
                foreach ($customJS as $JS) {
                    $modx->regClientHTMLBlock('<script defer src="' . $JS . '"></script>');
                }
            } else {
                $modx->regClientHTMLBlock('<script defer src="' . $customJS . '"></script>');
            }
        }
        if ($customInlineJS) {
            $modx->regClientHTMLBlock($customInlineJS);
        }
        break;
}

return '';