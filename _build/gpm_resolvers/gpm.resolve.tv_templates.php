<?php
/**
 * Resolve linking TVs and Templates
 *
 * THIS RESOLVER IS AUTOMATICALLY GENERATED, NO CHANGES WILL APPLY
 *
 * @package romanesco
 * @subpackage build
 *
 * @var mixed $object
 * @var modX $modx
 * @var array $options
 */

if ($object->xpdo) {
    $modx =& $object->xpdo;
    switch ($options[xPDOTransport::PACKAGE_ACTION]) {
        case xPDOTransport::ACTION_INSTALL:
        case xPDOTransport::ACTION_UPGRADE:
            /* list of tvs and templates for each */
            $tvs = array (
  'person_id' => 
  array (
    0 => 'Project',
  ),
  'organization_id' => 
  array (
    0 => 'Project',
    1 => 'Review',
  ),
  'contributors_id' => 
  array (
    0 => 'Project',
  ),
  'user_id' => 
  array (
  ),
  'social_connections' => 
  array (
    0 => 'Person',
  ),
  'links_related' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'external_links' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'links_attachment' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'header_visibility' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'header_title' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'header_subtitle' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'header_background' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'header_background_img' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'header_cta' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'header_inheritance' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'sidebar_sticky' => 
  array (
    0 => 'BasicDetail',
    1 => 'Basic - Detail',
  ),
  'sidebar_cta' => 
  array (
    0 => 'BasicDetail',
    1 => 'Basic - Detail',
  ),
  'sidebar_inheritance' => 
  array (
    0 => 'BasicDetail',
    1 => 'Basic - Detail',
  ),
  'footer_visibility' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'footer_type' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'footer_background' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'footer_cta' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'footer_cta_background' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'footer_inheritance' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'cta_availability' => 
  array (
    0 => 'GlobalCTA',
  ),
  'content_purpose' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'content_priority' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'content_brief' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'content_outline' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'content_result' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'content_cta' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'content_tone' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'status_progress' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'status_health' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'status_tasks' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'content_owner' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'planning_date_due' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'project_timeline' => 
  array (
    0 => 'ProjectDashboard',
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
    1 => 'fbRegister',
  ),
  'fb_activation_email_type' => 
  array (
    0 => 'fbRegister',
  ),
  'fb_activation_email_tpl' => 
  array (
    0 => 'fbRegister',
  ),
  'fb_activation_email' => 
  array (
    0 => 'fbRegister',
  ),
  'fb_submit_button' => 
  array (
    0 => 'fbForm',
    1 => 'fbRegister',
  ),
  'fb_save_form' => 
  array (
    0 => 'fbForm',
  ),
  'fb_redirect_id' => 
  array (
    0 => 'fbForm',
    1 => 'fbRegister',
  ),
  'fb_prehooks' => 
  array (
    0 => 'fbForm',
    1 => 'fbRegister',
  ),
  'fb_renderhooks' => 
  array (
    0 => 'fbForm',
  ),
  'fb_hooks' => 
  array (
    0 => 'fbForm',
    1 => 'fbRegister',
  ),
  'fb_posthooks' => 
  array (
    0 => 'fbForm',
    1 => 'fbRegister',
  ),
  'fb_email_to_dynamic' => 
  array (
    0 => 'fbForm',
  ),
  'fb_redirect_dynamic' => 
  array (
    0 => 'fbForm',
    1 => 'fbRegister',
  ),
  'fb_store_data' => 
  array (
    0 => 'fbForm',
  ),
  'fb_store_time' => 
  array (
    0 => 'fbForm',
  ),
  'fb_store_attachments' => 
  array (
    0 => 'fbForm',
  ),
  'fb_attachment_path' => 
  array (
    0 => 'fbForm',
  ),
  'fb_email_template' => 
  array (
    0 => 'fbForm',
  ),
  'fb_email_tpl_prefix' => 
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
  'fb_activation_toggle' => 
  array (
    0 => 'fbRegister',
  ),
  'fb_activation_resource_id' => 
  array (
    0 => 'fbRegister',
  ),
  'fb_activation_ttl' => 
  array (
    0 => 'fbRegister',
  ),
  'fb_username_field' => 
  array (
    0 => 'fbRegister',
  ),
  'fb_fullname_field' => 
  array (
    0 => 'fbRegister',
  ),
  'fb_password_field' => 
  array (
    0 => 'fbRegister',
  ),
  'fb_usergroups' => 
  array (
    0 => 'fbRegister',
  ),
  'fb_usergroups_field' => 
  array (
    0 => 'fbRegister',
  ),
  'fb_extended_toggle' => 
  array (
    0 => 'fbRegister',
  ),
  'background_availability' => 
  array (
    0 => 'GlobalBackground',
  ),
  'backstop_viewports' => 
  array (
    0 => 'RegressionTest',
  ),
  'backstop_engine' => 
  array (
    0 => 'RegressionTest',
  ),
  'backstop_engine_browser' => 
  array (
    0 => 'RegressionTest',
  ),
  'backstop_report' => 
  array (
    0 => 'RegressionTest',
  ),
  'backstop_async_capture_limit' => 
  array (
    0 => 'RegressionTest',
  ),
  'backstop_async_compare_limit' => 
  array (
    0 => 'RegressionTest',
  ),
  'backstop_scenario_tpl' => 
  array (
    0 => 'RegressionTest',
  ),
  'backstop_reference_url' => 
  array (
    0 => 'RegressionTest',
  ),
  'backstop_delay' => 
  array (
    0 => 'RegressionTest',
  ),
  'backstop_selectors' => 
  array (
    0 => 'RegressionTest',
  ),
  'backstop_selector_expansion' => 
  array (
    0 => 'RegressionTest',
  ),
  'backstop_selector_expect' => 
  array (
    0 => 'RegressionTest',
  ),
  'backstop_hide_selectors' => 
  array (
    0 => 'RegressionTest',
  ),
  'backstop_remove_selectors' => 
  array (
    0 => 'RegressionTest',
  ),
  'backstop_hover_selectors' => 
  array (
    0 => 'RegressionTest',
  ),
  'backstop_click_selectors' => 
  array (
    0 => 'RegressionTest',
  ),
  'backstop_keypress_selectors' => 
  array (
    0 => 'RegressionTest',
  ),
  'backstop_post_interaction_wait' => 
  array (
    0 => 'RegressionTest',
  ),
  'backstop_mismatch_threshold' => 
  array (
    0 => 'RegressionTest',
  ),
  'author_id' => 
  array (
    0 => 'Publications',
    1 => 'ArticleTraditional',
    2 => 'ArticleModern',
    3 => 'Download',
  ),
  'comments_toggle' => 
  array (
    0 => 'Publications',
    1 => 'ArticleTraditional',
    2 => 'ArticleModern',
    3 => 'Download',
  ),
  'contact_email' => 
  array (
    0 => 'Person',
  ),
  'contact_phone' => 
  array (
    0 => 'Person',
  ),
  'contact_mobile' => 
  array (
    0 => 'Person',
  ),
  'address_street_name' => 
  array (
    0 => 'Project',
  ),
  'address_house_number' => 
  array (
    0 => 'Project',
  ),
  'address_postal_code' => 
  array (
    0 => 'Project',
  ),
  'address_locality' => 
  array (
    0 => 'Project',
  ),
  'address_region' => 
  array (
    0 => 'Project',
  ),
  'address_country' => 
  array (
    0 => 'Project',
  ),
  'date_start' => 
  array (
    0 => 'Project',
  ),
  'date_end' => 
  array (
    0 => 'Project',
  ),
  'date_published' => 
  array (
    0 => 'Project',
  ),
  'rating_value' => 
  array (
    0 => 'Review',
  ),
  'organization_name' => 
  array (
    0 => 'Organization',
  ),
  'organization_sector' => 
  array (
    0 => 'Organization',
  ),
  'organization_industry' => 
  array (
    0 => 'Organization',
  ),
  'organization_size' => 
  array (
    0 => 'Organization',
  ),
  'organization_url' => 
  array (
    0 => 'Organization',
  ),
  'organization_logo_svg' => 
  array (
    0 => 'Organization',
  ),
  'organization_logo_img' => 
  array (
    0 => 'Organization',
  ),
  'person_firstname' => 
  array (
    0 => 'Person',
    1 => 'Review',
  ),
  'person_lastname' => 
  array (
    0 => 'Person',
    1 => 'Review',
  ),
  'person_gender' => 
  array (
    0 => 'Person',
    1 => 'Review',
  ),
  'person_birthdate' => 
  array (
    0 => 'Person',
    1 => 'Review',
  ),
  'person_jobtitle' => 
  array (
    0 => 'Person',
    1 => 'Review',
  ),
  'person_url' => 
  array (
    0 => 'Person',
    1 => 'Review',
  ),
  'person_image' => 
  array (
    0 => 'Person',
    1 => 'Review',
  ),
  'person_image_loose' => 
  array (
    0 => 'Person',
  ),
  'toolbar_visibility' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'auto_anchors' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'toc_headings' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'auto_references' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'pagination_scroll_top' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'neighbors_visibility' => 
  array (
    0 => 'Publications',
    1 => 'ArticleTraditional',
    2 => 'ArticleModern',
    3 => 'Download',
  ),
  'overview_img_landscape' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Download',
    10 => 'Project',
  ),
  'overview_img_portrait' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Download',
    10 => 'Project',
  ),
  'overview_img_square' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Download',
    10 => 'Project',
  ),
  'overview_img_wide' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Download',
    10 => 'Project',
  ),
  'overview_img_pano' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Download',
    10 => 'Project',
  ),
  'overview_img_free' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Download',
    10 => 'Project',
  ),
  'overview_img_svg' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Download',
    10 => 'Project',
  ),
  'overview_img_svg_credit' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Download',
    10 => 'Project',
  ),
  'overview_icon_svg' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'Download',
  ),
  'overview_icon_svg_credit' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'Download',
  ),
  'overview_icon_img' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Download',
    10 => 'Project',
  ),
  'overview_icon_font' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'Download',
  ),
  'overview_subtitle' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
  ),
  'overview_link_text' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Download',
    10 => 'Project',
  ),
  'critical_css_uri' => 
  array (
    0 => 'Home',
    1 => 'BasicOverview',
    2 => 'BasicDetail',
    3 => 'BasicDetailToC',
    4 => 'BasicVertical',
    5 => 'BasicVerticalToC',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleModern',
    9 => 'Notes',
    10 => 'NoteRegular',
    11 => 'NoteVertical',
    12 => 'Person',
    13 => 'Organization',
    14 => 'Review',
    15 => 'Project',
    16 => 'Presentation',
    17 => 'Dashboard',
  ),
  'slider_behaviour' => 
  array (
    0 => 'Presentation',
  ),
  'slider_transition' => 
  array (
    0 => 'Presentation',
  ),
  'slider_pagination' => 
  array (
    0 => 'Presentation',
  ),
  'slider_inverted' => 
  array (
    0 => 'Presentation',
  ),
  'social_twitter' => 
  array (
  ),
  'social_linkedin' => 
  array (
  ),
  'social_facebook' => 
  array (
  ),
  'social_instagram' => 
  array (
  ),
  'social_pinterest' => 
  array (
  ),
  'social_youtube' => 
  array (
  ),
  'social_whatsapp' => 
  array (
  ),
  'social_whatsapp_text' => 
  array (
  ),
  'social_github' => 
  array (
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