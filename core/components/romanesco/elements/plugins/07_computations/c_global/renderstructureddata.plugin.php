<?php
/**
 * RenderStructuredData
 *
 * Turn given schema.org properties into a proper JSON-LD array.
 *
 * All types are collected in a central @graph object, which is stored in the
 * Romanesco class. Properties can be redefined by creating a plugin on the same
 * event (OnLoadWebDocument) with a higher priority.
 *
 * The final graph object is stored as JSON inside the resource properties field.
 *
 * @depends https://github.com/spatie/schema-org
 *
 * @var modX $modx
 * @var array $scriptProperties
 * @package romanesco
 */

use Spatie\SchemaOrg\Schema;

switch ($modx->event->name) {
    case 'OnLoadWebDocument':
        $corePath = $modx->getOption('romanescobackyard.core_path', null, $modx->getOption('core_path').'components/romanescobackyard/');
        $romanesco = $modx->getService('romanesco','Romanesco', $corePath.'model/romanescobackyard/', array('core_path' => $corePath));
        if (!($romanesco instanceof Romanesco)) {
            $modx->log(modX::LOG_LEVEL_ERROR, '[Romanesco] Class not found!');
            break;
        }

        // System / context
        $siteName = $modx->getOption('site_name', $scriptProperties);
        $siteURL = $modx->getOption('site_url', $scriptProperties);
        $httpHost = $modx->getOption('http_host', $scriptProperties);
        $context = $modx->getOption('context_key', $scriptProperties);

        // ClientConfig
        $clientType = $modx->getOption('client_type', $scriptProperties, $romanesco->getConfigSetting('client_type'));
        $clientPhone = $modx->getOption('client_phone', $scriptProperties, $romanesco->getConfigSetting('client_phone'));
        $clientEmail = $modx->getOption('client_email', $scriptProperties, $romanesco->getConfigSetting('client_email'));
        $logoPath = $modx->getOption('logo_path', $scriptProperties, $romanesco->getConfigSetting('logo_path'));

        // Resource
        $pagetitle = $modx->resource->get('pagetitle');
        $longtitle = $modx->resource->get('longtitle');
        $description = $modx->resource->get('description');
        $introtext = $modx->resource->get('introtext');
        $url = $modx->makeUrl($modx->resource->id, null, null, 'full');

        // TVs
        $headerVisible = $modx->resource->getTVValue('header_visibility');
        $toolbarVisible = $modx->resource->getTVValue('toolbar_visibility');
        $authorID = $modx->resource->getTVValue('author_id');

        // Use the object initialized within the Romanesco class, to allow overwriting
        $graph = &$romanesco->structuredData;

        // Organization
        if ($clientType == 'organization') {
            $graph
                ->organization()
                ->name($siteName)
                ->url($siteURL)
                ->contactPoint(Schema::contactPoint()
                    ->telephone($clientPhone)
                    ->email($clientEmail)
                )
                ->logo(Schema::imageObject()
                    ->identifier($siteURL . "#logo")
                    ->url(str_replace("//", "/", $siteURL . $logoPath))
                    ->caption($siteName)
                )
                ->image([
                    '@id' => $siteURL . "#logo"
                ])
            ;
        }

        // Person
        if ($clientType == 'person') {
            $graph
                ->person()
                ->name($siteName)
                ->url($siteURL)
                ->contactPoint(Schema::contactPoint()
                    ->telephone($clientPhone)
                    ->email($clientEmail)
                )
            ;
        }

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

        $modx->setPlaceholder('structured_data', json_encode($graph,JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES));

        break;
}