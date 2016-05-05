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
  'fb_email_to_dynamic' => 
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
    3 => 'Publications',
    4 => 'ArticleTraditional',
    5 => 'ArticleReadability',
    6 => 'ArticleSidenotes',
    7 => 'Homepage',
    8 => 'Basic - Overview',
    9 => 'Basic - Detail',
    10 => 'Publications - Overview',
    11 => 'Article - Traditional',
    12 => 'Article - Readability',
    13 => 'Article - Sidenotes',
  ),
  'header_background' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'Publications',
    4 => 'ArticleTraditional',
    5 => 'ArticleReadability',
    6 => 'ArticleSidenotes',
    7 => 'Homepage',
    8 => 'Basic - Overview',
    9 => 'Basic - Detail',
    10 => 'Publications - Overview',
    11 => 'Article - Traditional',
    12 => 'Article - Readability',
    13 => 'Article - Sidenotes',
  ),
  'header_title' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'Publications',
    4 => 'ArticleTraditional',
    5 => 'ArticleReadability',
    6 => 'ArticleSidenotes',
    7 => 'Homepage',
    8 => 'Basic - Overview',
    9 => 'Basic - Detail',
    10 => 'Publications - Overview',
    11 => 'Article - Traditional',
    12 => 'Article - Readability',
    13 => 'Article - Sidenotes',
  ),
  'header_subtitle' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'Publications',
    4 => 'ArticleTraditional',
    5 => 'ArticleReadability',
    6 => 'ArticleSidenotes',
    7 => 'Homepage',
    8 => 'Basic - Overview',
    9 => 'Basic - Detail',
    10 => 'Publications - Overview',
    11 => 'Article - Traditional',
    12 => 'Article - Readability',
    13 => 'Article - Sidenotes',
  ),
  'header_background_img' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'Publications',
    4 => 'ArticleTraditional',
    5 => 'ArticleReadability',
    6 => 'ArticleSidenotes',
    7 => 'Homepage',
    8 => 'Basic - Overview',
    9 => 'Basic - Detail',
    10 => 'Publications - Overview',
    11 => 'Article - Traditional',
    12 => 'Article - Readability',
    13 => 'Article - Sidenotes',
  ),
  'header_inheritance' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'Publications',
    4 => 'ArticleTraditional',
    5 => 'ArticleReadability',
    6 => 'ArticleSidenotes',
    7 => 'Homepage',
    8 => 'Basic - Overview',
    9 => 'Basic - Detail',
    10 => 'Publications - Overview',
    11 => 'Article - Traditional',
    12 => 'Article - Readability',
    13 => 'Article - Sidenotes',
  ),
  'overview_img_landscape' => 
  array (
    0 => 'BasicOverview',
    1 => 'BasicDetail',
    2 => 'Basic - Overview',
    3 => 'Basic - Detail',
    4 => 'Publications',
    5 => 'ArticleTraditional',
    6 => 'ArticleReadability',
    7 => 'ArticleSidenotes',
    8 => 'Publications - Overview',
    9 => 'Article - Traditional',
    10 => 'Article - Readability',
    11 => 'Article - Sidenotes',
  ),
  'overview_img_portrait' => 
  array (
    0 => 'BasicOverview',
    1 => 'BasicDetail',
    2 => 'Basic - Overview',
    3 => 'Basic - Detail',
    4 => 'Publications',
    5 => 'ArticleTraditional',
    6 => 'ArticleReadability',
    7 => 'ArticleSidenotes',
    8 => 'Publications - Overview',
    9 => 'Article - Traditional',
    10 => 'Article - Readability',
    11 => 'Article - Sidenotes',
  ),
  'overview_img_square' => 
  array (
    0 => 'BasicOverview',
    1 => 'BasicDetail',
    2 => 'Basic - Overview',
    3 => 'Basic - Detail',
    4 => 'Publications',
    5 => 'ArticleTraditional',
    6 => 'ArticleReadability',
    7 => 'ArticleSidenotes',
    8 => 'Publications - Overview',
    9 => 'Article - Traditional',
    10 => 'Article - Readability',
    11 => 'Article - Sidenotes',
  ),
  'overview_img_wide' => 
  array (
    0 => 'BasicOverview',
    1 => 'BasicDetail',
    2 => 'Basic - Overview',
    3 => 'Basic - Detail',
    4 => 'Publications',
    5 => 'ArticleTraditional',
    6 => 'ArticleReadability',
    7 => 'ArticleSidenotes',
    8 => 'Publications - Overview',
    9 => 'Article - Traditional',
    10 => 'Article - Readability',
    11 => 'Article - Sidenotes',
  ),
  'overview_img_pano' => 
  array (
    0 => 'BasicOverview',
    1 => 'BasicDetail',
    2 => 'Basic - Overview',
    3 => 'Basic - Detail',
    4 => 'Publications',
    5 => 'ArticleTraditional',
    6 => 'ArticleReadability',
    7 => 'ArticleSidenotes',
    8 => 'Publications - Overview',
    9 => 'Article - Traditional',
    10 => 'Article - Readability',
    11 => 'Article - Sidenotes',
  ),
  'overview_img_priority' => 
  array (
    0 => 'BasicOverview',
    1 => 'BasicDetail',
    2 => 'Basic - Overview',
    3 => 'Basic - Detail',
    4 => 'Publications',
    5 => 'ArticleTraditional',
    6 => 'ArticleReadability',
    7 => 'ArticleSidenotes',
    8 => 'Publications - Overview',
    9 => 'Article - Traditional',
    10 => 'Article - Readability',
    11 => 'Article - Sidenotes',
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
    2 => 'Basic - Overview',
    3 => 'Basic - Detail',
    4 => 'Publications',
    5 => 'ArticleTraditional',
    6 => 'ArticleReadability',
    7 => 'ArticleSidenotes',
    8 => 'Publications - Overview',
    9 => 'Article - Traditional',
    10 => 'Article - Readability',
    11 => 'Article - Sidenotes',
  ),
  'project_hub_timeline' => 
  array (
    0 => 'ProjectHub',
  ),
  'status_indicator' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'Publications',
    4 => 'ArticleTraditional',
    5 => 'ArticleReadability',
    6 => 'ArticleSidenotes',
    7 => 'Homepage',
    8 => 'Basic - Overview',
    9 => 'Basic - Detail',
    10 => 'Publications - Overview',
    11 => 'Article - Traditional',
    12 => 'Article - Readability',
    13 => 'Article - Sidenotes',
  ),
  'article_author' => 
  array (
    0 => 'ArticleTraditional',
    1 => 'ArticleReadability',
    2 => 'ArticleSidenotes',
    3 => 'Article - Traditional',
    4 => 'Article - Readability',
    5 => 'Article - Sidenotes',
  ),
  'article_comments' => 
  array (
    0 => 'ArticleTraditional',
    1 => 'ArticleReadability',
    2 => 'ArticleSidenotes',
    3 => 'Article - Traditional',
    4 => 'Article - Readability',
    5 => 'Article - Sidenotes',
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