<?php
/**
 * RenderStructuredData
 *
 * Turn given schema.org properties into a proper JSON-LD array.
 *
 * All types are collected in a central @graph object, which is stored in the
 * Romanesco class. Properties can be redefined by creating a plugin on the same
 * event (OnDocFormSave) with a higher priority.
 *
 * The final graph object is stored as JSON inside the resource properties field.
 *
 * @depends https://github.com/spatie/schema-org
 *
 * @var modX $modx
 * @package romanesco
 */

use Spatie\SchemaOrg\Schema;
use Spatie\SchemaOrg\Graph;

switch ($modx->event->name) {
    case 'OnDocFormSave':
        $corePath = $modx->getOption('romanescobackyard.core_path', null, $modx->getOption('core_path').'components/romanescobackyard/');
        $romanesco = $modx->getService('romanesco','Romanesco', $corePath.'model/romanescobackyard/', array('core_path' => $corePath));

        /** @var array $scriptProperties */
        $toolbarVisible = $modx->getOption('toolbar_visibility', $scriptProperties, true);

        // System / context
        $siteName = $modx->getOption('site_name', $scriptProperties);
        $siteURL = $modx->getOption('site_url', $scriptProperties);
        $httpHost = $modx->getOption('http_host', $scriptProperties);
        $context = $modx->getOption('context_key', $scriptProperties);

        // ClientConfig
        $clientType = $modx->getOption('client_type', $scriptProperties, $modx->romanesco->getConfigSetting('client_type'));
        $clientPhone = $modx->getOption('client_phone', $scriptProperties, $modx->romanesco->getConfigSetting('client_phone'));
        $clientEmail = $modx->getOption('client_email', $scriptProperties, $modx->romanesco->getConfigSetting('client_email'));

        // Resource
        $pagetitle = $modx->resource->get('pagetitle');
        $longtitle = $modx->resource->get('longtitle');
        $description = $modx->resource->get('description');
        $introtext = $modx->resource->get('introtext');
        $url = $modx->makeUrl($modx->resource->id, null, null, 'full');

        // Use the object initialized within the Romanesco class, to allow overwriting
        $graph = &$romanesco->structuredData;

        // Organization
        $graph
            ->organization()
            ->name($siteName)
            ->url($siteURL)
            ->contactPoint(Schema::contactPoint()
                ->telephone($clientPhone)
                ->email($clientEmail)
            )
        ;

        // Page
        $graph
            ->webPage()
            ->name($longtitle ?: $pagetitle)
            ->description($description ?: strip_tags($introtext))
            ->url($url)
        ;

        // Breadcrumbs
        if ($toolbarVisible) {
            $crumbs = array($modx->runSnippet('pdoCrumbs', [
                'from' => 0,
                'to' => $modx->resource->id,
                'where' => '{"alias_visible:!=":"0"}',
                'return' => 'data'
            ]));

            $crumbItems = [];
            foreach ($crumbs[0] as $crumb) {
                $crumbItems[] = Schema::listItem()
                    ->position($crumb['idx'])
                    ->item([
                        '@id' => $siteURL . $crumb['uri'],
                        'name' => $crumb['menutitle'] ?? $crumb['pagetitle']
                    ])
                ;
            }

            $graph
                ->breadcrumbList()
                ->identifier('#breadcrumb')
                ->itemListElement($crumbItems)
            ;
        }

        //$modx->log(modX::LOG_LEVEL_ERROR, print_r($graph->toArray(), true));

        /** @var modResource $resource */
        $resource->setProperties(["schema" => $graph],'romanesco');
        $resource->save();
        break;

    case 'OnLoadWebDocument':
        $properties = $modx->resource->getProperties('romanesco');

        if (isset($properties['schema'])) {
            $modx->regClientStartupHTMLBlock('<script type="application/ld+json">'.json_encode($properties['schema'],JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT).'</script>');
        }
        break;
}