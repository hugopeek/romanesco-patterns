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
  'article_author' => 
  array (
    0 => 'BlogArticle',
    1 => 'NewsArticle',
    2 => 'Blog - Article',
    3 => 'News - Article',
  ),
  'article_comments' => 
  array (
    0 => 'BlogArticle',
    1 => 'NewsArticle',
    2 => 'Blog - Article',
    3 => 'News - Article',
  ),
  'cta_availability' => 
  array (
    0 => 'GlobalCTA',
  ),
  'fb_email_to' => 
  array (
    0 => 'fbForm',
  ),
  'fb_email_cc' => 
  array (
    0 => 'fbForm',
  ),
  'fb_email_bcc' => 
  array (
    0 => 'fbForm',
  ),
  'fb_email_from' => 
  array (
    0 => 'fbForm',
  ),
  'fb_email_from_name' => 
  array (
    0 => 'fbForm',
  ),
  'fb_email_subject' => 
  array (
    0 => 'fbForm',
  ),
  'fb_redirect_id' => 
  array (
    0 => 'fbForm',
  ),
  'fb_submit_button' => 
  array (
    0 => 'fbForm',
  ),
  'fb_form_layout' => 
  array (
    0 => 'fbForm',
  ),
  'fb_email_template' => 
  array (
    0 => 'fbForm',
  ),
  'fb_email_template_rows' => 
  array (
    0 => 'fbForm',
  ),
  'fb_autoresponder_toggle' => 
  array (
    0 => 'fbForm',
  ),
  'fb_autoresponder_from' => 
  array (
    0 => 'fbForm',
  ),
  'fb_autoresponder_from_name' => 
  array (
    0 => 'fbForm',
  ),
  'fb_autoresponder_reply_to' => 
  array (
    0 => 'fbForm',
  ),
  'fb_autoresponder_subject' => 
  array (
    0 => 'fbForm',
  ),
  'fb_autoresponder_message' => 
  array (
    0 => 'fbForm',
  ),
  'global_background_img' => 
  array (
    0 => 'GlobalBackgrounds',
  ),
  'header_cta' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BlogArticle',
    4 => 'NewsArticle',
    5 => 'Homepage',
    6 => 'Basic - Overview',
    7 => 'Basic - Detail',
    8 => 'Blog - Article',
    9 => 'News - Article',
  ),
  'header_background' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BlogArticle',
    4 => 'NewsArticle',
    5 => 'Homepage',
    6 => 'Basic - Overview',
    7 => 'Basic - Detail',
    8 => 'Blog - Article',
    9 => 'News - Article',
  ),
  'header_title' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BlogArticle',
    4 => 'NewsArticle',
    5 => 'Homepage',
    6 => 'Basic - Overview',
    7 => 'Basic - Detail',
    8 => 'Blog - Article',
    9 => 'News - Article',
  ),
  'header_subtitle' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BlogArticle',
    4 => 'NewsArticle',
    5 => 'Homepage',
    6 => 'Basic - Overview',
    7 => 'Basic - Detail',
    8 => 'Blog - Article',
    9 => 'News - Article',
  ),
  'overview_img_landscape' => 
  array (
    0 => 'BasicOverview',
    1 => 'BasicDetail',
    2 => 'BlogArticle',
    3 => 'NewsArticle',
    4 => 'Basic - Overview',
    5 => 'Basic - Detail',
    6 => 'Blog - Article',
    7 => 'News - Article',
  ),
  'overview_img_portrait' => 
  array (
    0 => 'BasicOverview',
    1 => 'BasicDetail',
    2 => 'BlogArticle',
    3 => 'NewsArticle',
    4 => 'Basic - Overview',
    5 => 'Basic - Detail',
    6 => 'Blog - Article',
    7 => 'News - Article',
  ),
  'overview_img_square' => 
  array (
    0 => 'BasicOverview',
    1 => 'BasicDetail',
    2 => 'BlogArticle',
    3 => 'NewsArticle',
    4 => 'Basic - Overview',
    5 => 'Basic - Detail',
    6 => 'Blog - Article',
    7 => 'News - Article',
  ),
  'overview_img_wide' => 
  array (
    0 => 'BasicOverview',
    1 => 'BasicDetail',
    2 => 'BlogArticle',
    3 => 'NewsArticle',
    4 => 'Basic - Overview',
    5 => 'Basic - Detail',
    6 => 'Blog - Article',
    7 => 'News - Article',
  ),
  'overview_img_pano' => 
  array (
    0 => 'BasicOverview',
    1 => 'BasicDetail',
    2 => 'BlogArticle',
    3 => 'NewsArticle',
    4 => 'Basic - Overview',
    5 => 'Basic - Detail',
    6 => 'Blog - Article',
    7 => 'News - Article',
  ),
  'overview_img_priority' => 
  array (
    0 => 'BasicOverview',
    1 => 'BasicDetail',
    2 => 'BlogArticle',
    3 => 'NewsArticle',
    4 => 'Basic - Overview',
    5 => 'Basic - Detail',
    6 => 'Blog - Article',
    7 => 'News - Article',
  ),
  'overview_icon_svg' => 
  array (
    0 => 'BasicOverview',
    1 => 'BasicDetail',
    2 => 'Basic - Overview',
    3 => 'Basic - Detail',
  ),
  'overview_icon_font' => 
  array (
    0 => 'BasicOverview',
    1 => 'BasicDetail',
    2 => 'Basic - Overview',
    3 => 'Basic - Detail',
  ),
  'overview_link_text' => 
  array (
    0 => 'BasicOverview',
    1 => 'BasicDetail',
    2 => 'BlogArticle',
    3 => 'NewsArticle',
    4 => 'Basic - Overview',
    5 => 'Basic - Detail',
    6 => 'Blog - Article',
    7 => 'News - Article',
  ),
  'project_hub_timeline' => 
  array (
    0 => 'ProjectHub',
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