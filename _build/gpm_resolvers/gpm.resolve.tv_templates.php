<?php
/**
 * Resolve linking TVs and Templates
 *
 * THIS RESOLVER IS AUTOMATICALLY GENERATED, NO CHANGES WILL APPLY
 *
 * @package patternlab
 * @subpackage build
 */

if ($object->xpdo) {
    $modx =& $object->xpdo;
    switch ($options[xPDOTransport::PACKAGE_ACTION]) {
        case xPDOTransport::ACTION_INSTALL:
        case xPDOTransport::ACTION_UPGRADE:
            /* list of tvs and templates for each */
            $tvs = array (
  'overview_img_default' => 
  array (
    0 => 'Default - Overview',
    1 => 'Default - Detail',
  ),
  'overview_img_square' => 
  array (
    0 => 'Default - Overview',
    1 => 'Default - Detail',
  ),
  'overview_img_wide' => 
  array (
    0 => 'Default - Overview',
    1 => 'Default - Detail',
  ),
  'overview_img_pano' => 
  array (
    0 => 'Default - Overview',
    1 => 'Default - Detail',
  ),
  'overview_icon_svg' => 
  array (
    0 => 'Default - Overview',
    1 => 'Default - Detail',
  ),
  'overview_icon_font' => 
  array (
    0 => 'Default - Overview',
    1 => 'Default - Detail',
  ),
);
            foreach ($tvs as $tvName => $templateNames) {
                if (!is_array($templateNames) || empty($templateNames)) continue;
                $tv = $modx->getObject('modTemplateVar',array('name' => $tvName));
                if (empty($tv)) {
                    $modx->log(xPDO::LOG_LEVEL_ERROR,'Could not find TV: '.$tvName.' to associate to Templates.');
                    continue;
                }
                $rank = 0;
                foreach ($templateNames as $templateName) {
                    $template = $modx->getObject('modTemplate',array('templatename' => $templateName));
                    if (!empty($template)) {
                        $templateVarTemplate = $modx->getObject('modTemplateVarTemplate',array(
                            'tmplvarid' => $tv->get('id'),
                            'templateid' => $template->get('id'),
                        ));
                        if (!$templateVarTemplate) {
                            $templateVarTemplate = $modx->newObject('modTemplateVarTemplate');
                            $templateVarTemplate->fromArray(array(
                                'tmplvarid' => $tv->get('id'),
                                'templateid' => $template->get('id'),
                                'rank' => $rank,
                            ),'',true,true);
                            if ($templateVarTemplate->save() == false) {
                                $modx->log(xPDO::LOG_LEVEL_ERROR,'An unknown error occurred while trying to associate the TV '.$tvName.' to the Template '.$templateName);
                            }
                        }
                    } else {
                        $modx->log(xPDO::LOG_LEVEL_ERROR,'Could not find Template '.$templateName);
                    }
                    $rank++;
                }
            }
            break;
    }
}
return true;