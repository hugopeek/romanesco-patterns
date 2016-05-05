<?php
/**
 *
 * Resolve Resources
 *
 * THIS RESOLVER IS AUTOMATICALLY GENERATED, NO CHANGES WILL APPLY
 *
 * @package patternlab
 * @subpackage build
 */

if (!$object->xpdo) return false;
/** @var modX $modx */
$modx =& $object->xpdo;

if (!function_exists('getResourceMap')) {
    function getResourceMap() {
        global $modx;

        $assetsPath = rtrim($modx->getOption('patternlab.assets_path',null,$modx->getOption('assets_path').'components/patternlab/'), '/') . '/';
        $rmf = $assetsPath . 'resourcemap.php';

        if (is_readable($rmf)) {
            $map = include $rmf;
        } else {
            $map = array();
        }

        return $map;
    }
}

if (!function_exists('setResourceMap')) {
    function setResourceMap($resourceMap) {
        global $modx;

        $assetsPath = rtrim($modx->getOption('patternlab.assets_path',null,$modx->getOption('assets_path').'components/patternlab/'), '/') . '/';
        $rmf = $assetsPath . 'resourcemap.php';
        file_put_contents($rmf, '<?php return ' . var_export($resourceMap, true) . ';');

    }
}

if (!function_exists('createResource')) {
    function createResource($resource) {
        global $modx;

        if (isset($resource['tvs'])) {
            $tvs = $resource['tvs'];
            unset($resource['tvs']);
        } else {
            $tvs = array();
        }
        
        if (isset($resource['others'])) {
            $others = $resource['others'];
            unset($resource['others']);

            $taggerCorePath = $modx->getOption('tagger.core_path', null, $modx->getOption('core_path', null, MODX_CORE_PATH) . 'components/tagger/');
            if (file_exists($taggerCorePath . 'model/tagger/tagger.class.php')) {
                /** @var Tagger $tagger */
                $tagger = $modx->getService(
                    'tagger',
                    'Tagger',
                    $taggerCorePath . 'model/tagger/',
                    array(
                        'core_path' => $taggerCorePath
                    )
                );
            
                $tagger = $tagger instanceof Tagger;
            } else {
                $tagger = null;
            }
            
            foreach ($others as $other) {
                if (($tagger == true) && (strpos($other['name'], 'tagger-') !== false)) {
                    $groupAlias = preg_replace('/tagger-/', '', $other['name'], 1);
            
                    $group = $modx->getObject('TaggerGroup', array('alias' => $groupAlias));
                    if ($group) {
                        $other['name'] = 'tagger-' . $group->id;
                    }
                }
            
                $resource[$other['name']] = $other['value'];
            }
        }

        $res = $modx->runProcessor('resource/create', $resource);
        $resObject = $res->getObject();

        if ($resObject && isset($resObject['id'])) {
            /** @var modResource $modResource */
            $modResource = $modx->getObject('modResource', array('id' => $resObject['id']));

            if ($modResource) {
                foreach ($tvs as $tv) {
                    $modResource->setTVValue($tv['name'], $tv['value']);
                }

                return $modResource->id;
            }
        }

        return false;
    }
}

if (!function_exists('updateResource')) {
    function updateResource($resource) {
        global $modx;

        if (isset($resource['tvs'])) {
            $tvs = $resource['tvs'];
            unset($resource['tvs']);
        } else {
            $tvs = array();
        }

        if (isset($resource['others'])) {
            $others = $resource['others'];
            unset($resource['others']);

            $taggerCorePath = $modx->getOption('tagger.core_path', null, $modx->getOption('core_path', null, MODX_CORE_PATH) . 'components/tagger/');
            if (file_exists($taggerCorePath . 'model/tagger/tagger.class.php')) {
                /** @var Tagger $tagger */
                $tagger = $modx->getService(
                    'tagger',
                    'Tagger',
                    $taggerCorePath . 'model/tagger/',
                    array(
                        'core_path' => $taggerCorePath
                    )
                );
            
                $tagger = $tagger instanceof Tagger;
            } else {
                $tagger = null;
            }

            foreach ($others as $other) {
                if (($tagger == true) && (strpos($other['name'], 'tagger-') !== false)) {
                    $groupAlias = preg_replace('/tagger-/', '', $other['name'], 1);
                
                    $group = $modx->getObject('TaggerGroup', array('alias' => $groupAlias));
                    if ($group) {
                        $other['name'] = 'tagger-' . $group->id;
                    }
                }

                $resource[$other['name']] = $other['value'];
            }
        }

        $res = $modx->runProcessor('resource/update', $resource);
        $resObject = $res->getObject();

        if ($resObject && isset($resObject['id'])) {
            /** @var modResource $modResource */
            $modResource = $modx->getObject('modResource', array('id' => $resObject['id']));

            if ($modResource) {
                foreach ($tvs as $tv) {
                    $modResource->setTVValue($tv['name'], $tv['value']);
                }

                return $modResource->id;
            }
        }

        return false;
    }
}

switch ($options[xPDOTransport::PACKAGE_ACTION]) {
    case xPDOTransport::ACTION_INSTALL:
    case xPDOTransport::ACTION_UPGRADE:
        $resources = array (
  0 => 
  array (
    'pagetitle' => 'Footers',
    'alias' => 'footers',
    'parent' => 0,
    'content' => '',
    'context_key' => 'global',
    'class_key' => 'CollectionContainer',
    'longtitle' => '',
    'description' => '',
    'isfolder' => 0,
    'introtext' => '',
    'deleted' => 0,
    'menutitle' => '',
    'hide_children_in_tree' => 0,
    'show_in_tree' => 1,
    'set_as_home' => 0,
    'tvs' => 
    array (
    ),
    'others' => 
    array (
      0 => 
      array (
        'name' => 'collections_template',
        'value' => '6',
      ),
    ),
    'link_attributes' => '',
    'properties' => '',
    'template' => 'BasicOverview',
    'published' => 1,
    'searchable' => 0,
  ),
  1 => 
  array (
    'pagetitle' => 'Forms',
    'alias' => 'forms',
    'parent' => 0,
    'content' => '',
    'context_key' => 'global',
    'class_key' => 'CollectionContainer',
    'longtitle' => '',
    'description' => '',
    'isfolder' => 0,
    'introtext' => '',
    'deleted' => 0,
    'menutitle' => '',
    'hide_children_in_tree' => 0,
    'show_in_tree' => 1,
    'set_as_home' => 0,
    'tvs' => 
    array (
    ),
    'others' => 
    array (
      0 => 
      array (
        'name' => 'collections_template',
        'value' => '2',
      ),
    ),
    'link_attributes' => '',
    'properties' => '',
    'template' => 'BasicOverview',
    'published' => 1,
    'searchable' => 0,
  ),
  2 => 
  array (
    'pagetitle' => 'Call To Actions',
    'alias' => 'call-to-actions',
    'parent' => 0,
    'content' => '',
    'context_key' => 'global',
    'class_key' => 'CollectionContainer',
    'longtitle' => '',
    'description' => '',
    'isfolder' => 0,
    'introtext' => '',
    'deleted' => 0,
    'menutitle' => '',
    'hide_children_in_tree' => 0,
    'show_in_tree' => 1,
    'set_as_home' => 0,
    'tvs' => 
    array (
    ),
    'others' => 
    array (
      0 => 
      array (
        'name' => 'collections_template',
        'value' => '3',
      ),
    ),
    'link_attributes' => '',
    'properties' => '',
    'template' => 'BasicOverview',
    'published' => 1,
    'searchable' => 0,
  ),
  3 => 
  array (
    'pagetitle' => 'Backgrounds',
    'alias' => 'backgrounds',
    'parent' => 0,
    'content' => '',
    'context_key' => 'global',
    'class_key' => 'modDocument',
    'longtitle' => '',
    'description' => '',
    'isfolder' => 0,
    'introtext' => '',
    'deleted' => 0,
    'menutitle' => '',
    'hide_children_in_tree' => 0,
    'show_in_tree' => 1,
    'set_as_home' => 0,
    'tvs' => 
    array (
    ),
    'others' => 
    array (
    ),
    'link_attributes' => '',
    'properties' => '',
    'template' => 'GlobalBackgrounds',
    'content_type' => 'css',
    'published' => 1,
    'searchable' => 0,
  ),
  4 => 
  array (
    'pagetitle' => 'Atoms',
    'alias' => 'atoms',
    'parent' => 'Pattern library',
    'content' => '',
    'context_key' => 'hub',
    'class_key' => 'modDocument',
    'longtitle' => '',
    'description' => '',
    'isfolder' => 0,
    'introtext' => '',
    'deleted' => 0,
    'menutitle' => '',
    'hide_children_in_tree' => 0,
    'show_in_tree' => 1,
    'set_as_home' => 0,
    'tvs' => 
    array (
    ),
    'others' => 
    array (
    ),
    'link_attributes' => '',
    'properties' => '',
    'template' => 'BasicOverview',
    'published' => 1,
  ),
  5 => 
  array (
    'pagetitle' => 'Molecules',
    'alias' => 'molecules',
    'parent' => 'Pattern library',
    'content' => '',
    'context_key' => 'hub',
    'class_key' => 'modDocument',
    'longtitle' => '',
    'description' => '',
    'isfolder' => 0,
    'introtext' => '',
    'deleted' => 0,
    'menutitle' => '',
    'hide_children_in_tree' => 0,
    'show_in_tree' => 1,
    'set_as_home' => 0,
    'tvs' => 
    array (
    ),
    'others' => 
    array (
    ),
    'link_attributes' => '',
    'properties' => '',
    'template' => 'BasicOverview',
    'published' => 1,
  ),
  6 => 
  array (
    'pagetitle' => 'Organisms',
    'alias' => 'organisms',
    'parent' => 'Pattern library',
    'content' => '',
    'context_key' => 'hub',
    'class_key' => 'modDocument',
    'longtitle' => '',
    'description' => '',
    'isfolder' => 0,
    'introtext' => '',
    'deleted' => 0,
    'menutitle' => '',
    'hide_children_in_tree' => 0,
    'show_in_tree' => 1,
    'set_as_home' => 0,
    'tvs' => 
    array (
    ),
    'others' => 
    array (
    ),
    'link_attributes' => '',
    'properties' => '',
    'template' => 'BasicOverview',
    'published' => 1,
  ),
  7 => 
  array (
    'pagetitle' => 'Templates',
    'alias' => 'templates',
    'parent' => 'Pattern library',
    'content' => '',
    'context_key' => 'hub',
    'class_key' => 'modDocument',
    'longtitle' => '',
    'description' => '',
    'isfolder' => 0,
    'introtext' => '',
    'deleted' => 0,
    'menutitle' => '',
    'hide_children_in_tree' => 0,
    'show_in_tree' => 1,
    'set_as_home' => 0,
    'tvs' => 
    array (
    ),
    'others' => 
    array (
    ),
    'link_attributes' => '',
    'properties' => '',
    'template' => 'BasicOverview',
    'published' => 1,
  ),
  8 => 
  array (
    'pagetitle' => 'Pages',
    'alias' => 'pages',
    'parent' => 'Pattern library',
    'content' => '',
    'context_key' => 'hub',
    'class_key' => 'modDocument',
    'longtitle' => '',
    'description' => '',
    'isfolder' => 0,
    'introtext' => '',
    'deleted' => 0,
    'menutitle' => '',
    'hide_children_in_tree' => 0,
    'show_in_tree' => 1,
    'set_as_home' => 0,
    'tvs' => 
    array (
    ),
    'others' => 
    array (
    ),
    'link_attributes' => '',
    'properties' => '',
    'template' => 'BasicOverview',
    'published' => 1,
  ),
  9 => 
  array (
    'pagetitle' => 'Project Hub',
    'alias' => 'project-hub',
    'parent' => 0,
    'content' => '',
    'context_key' => 'hub',
    'class_key' => 'modDocument',
    'longtitle' => '',
    'description' => '',
    'isfolder' => 0,
    'introtext' => '',
    'deleted' => 0,
    'menutitle' => '',
    'hide_children_in_tree' => 0,
    'show_in_tree' => 1,
    'set_as_home' => 0,
    'tvs' => 
    array (
    ),
    'others' => 
    array (
    ),
    'link_attributes' => '',
    'properties' => '',
    'template' => 'ProjectHub',
    'published' => 1,
  ),
  10 => 
  array (
    'pagetitle' => 'Pattern Library',
    'alias' => 'pattern-library',
    'parent' => 0,
    'content' => '',
    'context_key' => 'hub',
    'class_key' => 'modDocument',
    'longtitle' => '',
    'description' => '',
    'isfolder' => 0,
    'introtext' => '',
    'deleted' => 0,
    'menutitle' => '',
    'hide_children_in_tree' => 0,
    'show_in_tree' => 1,
    'set_as_home' => 0,
    'tvs' => 
    array (
    ),
    'others' => 
    array (
    ),
    'link_attributes' => '',
    'properties' => '',
    'template' => 'BasicOverview',
    'published' => 1,
  ),
  11 => 
  array (
    'pagetitle' => 'Backgrounds CSS',
    'alias' => 'assets/css/backgrounds',
    'parent' => 0,
    'content' => '[[++patternlab.global_backgrounds_id]]',
    'context_key' => 'web',
    'class_key' => 'modSymLink',
    'longtitle' => '',
    'description' => '',
    'isfolder' => 0,
    'introtext' => '',
    'deleted' => 0,
    'menutitle' => '',
    'hide_children_in_tree' => 0,
    'show_in_tree' => 0,
    'set_as_home' => 0,
    'tvs' => 
    array (
    ),
    'others' => 
    array (
    ),
    'link_attributes' => '',
    'properties' => '',
    'template' => 'GlobalBackgrounds',
    'content_type' => 'css',
    'published' => 1,
    'hidemenu' => 1,
    'searchable' => 0,
  ),
);

        if (isset($options['install_resources']) && empty($options['install_resources'])) return true;

        $resourceMap = getResourceMap();
        $toRemove = $resourceMap;
        $siteStart = $modx->getOption('site_start');

        foreach ($resources as $resource) {
            if (is_string($resource['parent'])) {
                if (isset($resourceMap[$resource['parent']])) {
                    $resource['parent'] = $resourceMap[$resource['parent']];
                } else {
                    /** @var modResource $parent */
                    $parent = $modx->getObject('modResource', array('pagetitle' => $resource['parent']));
                    if ($parent) {
                        $resource['parent'] = $parent->id;
                    }
                }
            } else {
                if ($resource['parent'] != 0) {
                    /** @var modResource $parent */
                    $parent = $modx->getObject('modResource', array('id' => $resource['parent']));
                    if ($parent) {
                        $resource['parent'] = $parent->id;
                    }
                } else {
                    $resource['parent'] = 0;
                }
            }

            if ($resource['template'] !== null) {
                if ($resource['template'] !== 0) {
                    $template = $modx->getObject('modTemplate', array('templatename' => $resource['template']));
                    if ($template) {
                        $resource['template'] = $template->id;
                    }
                } else {
                    $resource['template'] = 0;
                }
            }

            if ($resource['content_type'] !== null) {
                $content_type = $modx->getObject('modContentType', array('name' => $resource['content_type']));
                if ($content_type) {
                    $resource['content_type'] = $content_type->id;
                }
            } else {
                $resource['content_type'] = $modx->getOption('default_content_type', null, 1);
            }

            if (isset($resourceMap[$resource['pagetitle']])) {
                unset($toRemove[$resource['pagetitle']]);

                /** @var modResource $exists */
                $exists = $modx->getObject('modResource', array('id' => $resourceMap[$resource['pagetitle']]));
                if ($exists) {
                    $resource['id'] = $exists->id;
                    $resId = updateResource($resource);

                    if ($resId !== false) {
                        $resourceMap[$resource['pagetitle']] = $resId;
                    }
                } else {
                    if ($resource['set_as_home'] == 1) {
                        unset($resource['set_as_home']);
                        $resource['id'] = $siteStart;

                        $resId = updateResource($resource);

                        if ($resId !== false) {
                            $resourceMap[$resource['pagetitle']] = $resId;
                        }
                    } else {
                        $resId = createResource($resource);

                        if ($resId !== false) {
                            $resourceMap[$resource['pagetitle']] = $resId;
                        }
                    }
                }
            } else {
                if ($resource['set_as_home'] == 1) {
                    unset($resource['set_as_home']);
                    $resource['id'] = $siteStart;
                
                    $resId = updateResource($resource);
                
                    if ($resId !== false) {
                        $resourceMap[$resource['pagetitle']] = $resId;
                    }
                } else {
                    $resId = createResource($resource);

                    if ($resId !== false) {
                        $resourceMap[$resource['pagetitle']] = $resId;
                    }
                }
            }
        }

        foreach ($toRemove as $pageTitle => $resource) {
            unset($resourceMap[$pageTitle]);

            if ($resource == $siteStart) continue;

            /** @var modResource $modResource */
            $modResource = $modx->getObject('modResource', $resource);
            if ($modResource) {
                $modx->updateCollection('modResource', array('parent' => 0), array('parent' => $resource));

                $modResource->remove();
            }
        }

        setResourceMap($resourceMap);

        break;
    case xPDOTransport::ACTION_UNINSTALL:

        break;
}

return true;