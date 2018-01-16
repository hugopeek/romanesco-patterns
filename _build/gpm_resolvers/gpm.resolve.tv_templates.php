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
    0 => 'PortfolioProject',
    1 => 'Porfolio - Project',
  ),
  'organization_id' => 
  array (
    0 => 'PortfolioProject',
    1 => 'Porfolio - Project',
    2 => 'Testimonial',
    3 => 'Review',
    4 => 'Endorsement',
  ),
  'contributors_id' => 
  array (
    0 => 'PortfolioProject',
    1 => 'Porfolio - Project',
  ),
  'user_id' => 
  array (
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
  'fb_prehooks' => 
  array (
    0 => 'fbForm',
  ),
  'fb_hooks' => 
  array (
    0 => 'fbForm',
  ),
  'fb_email_to_dynamic' => 
  array (
    0 => 'fbForm',
  ),
  'fb_redirect_dynamic' => 
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
    1 => 'Homepage',
    2 => 'BasicOverview',
    3 => 'Basic - Overview',
    4 => 'BasicDetail',
    5 => 'Basic - Detail',
    6 => 'HeaderVertical',
    7 => 'Header - Vertical',
    8 => 'Publications',
    9 => 'Publications - Overview',
    10 => 'Blog',
    11 => 'ArticleTraditional',
    12 => 'Article - Traditional',
    13 => 'ArticleReadability',
    14 => 'Article - Readability',
    15 => 'ArticleSidenotes',
    16 => 'Article - Sidenotes',
    17 => 'TeamMember',
    18 => 'Team - Member',
    19 => 'Team',
    20 => 'Client',
    21 => 'Organization',
    22 => 'Relation',
    23 => 'PortfolioProject',
    24 => 'Porfolio - Project',
    25 => 'Testimonial',
    26 => 'Review',
    27 => 'Endorsement',
  ),
  'header_background' => 
  array (
    0 => 'Home',
    1 => 'Homepage',
    2 => 'BasicOverview',
    3 => 'Basic - Overview',
    4 => 'BasicDetail',
    5 => 'Basic - Detail',
    6 => 'HeaderVertical',
    7 => 'Header - Vertical',
    8 => 'Publications',
    9 => 'Publications - Overview',
    10 => 'Blog',
    11 => 'ArticleTraditional',
    12 => 'Article - Traditional',
    13 => 'ArticleReadability',
    14 => 'Article - Readability',
    15 => 'ArticleSidenotes',
    16 => 'Article - Sidenotes',
    17 => 'TeamMember',
    18 => 'Team - Member',
    19 => 'Team',
    20 => 'Client',
    21 => 'Organization',
    22 => 'Relation',
    23 => 'PortfolioProject',
    24 => 'Porfolio - Project',
    25 => 'Testimonial',
    26 => 'Review',
    27 => 'Endorsement',
  ),
  'header_title' => 
  array (
    0 => 'Home',
    1 => 'Homepage',
    2 => 'BasicOverview',
    3 => 'Basic - Overview',
    4 => 'BasicDetail',
    5 => 'Basic - Detail',
    6 => 'HeaderVertical',
    7 => 'Header - Vertical',
    8 => 'Publications',
    9 => 'Publications - Overview',
    10 => 'Blog',
    11 => 'ArticleTraditional',
    12 => 'Article - Traditional',
    13 => 'ArticleReadability',
    14 => 'Article - Readability',
    15 => 'ArticleSidenotes',
    16 => 'Article - Sidenotes',
    17 => 'TeamMember',
    18 => 'Team - Member',
    19 => 'Team',
    20 => 'Client',
    21 => 'Organization',
    22 => 'Relation',
    23 => 'PortfolioProject',
    24 => 'Porfolio - Project',
    25 => 'Testimonial',
    26 => 'Review',
    27 => 'Endorsement',
  ),
  'header_subtitle' => 
  array (
    0 => 'Home',
    1 => 'Homepage',
    2 => 'BasicOverview',
    3 => 'Basic - Overview',
    4 => 'BasicDetail',
    5 => 'Basic - Detail',
    6 => 'HeaderVertical',
    7 => 'Header - Vertical',
    8 => 'Publications',
    9 => 'Publications - Overview',
    10 => 'Blog',
    11 => 'ArticleTraditional',
    12 => 'Article - Traditional',
    13 => 'ArticleReadability',
    14 => 'Article - Readability',
    15 => 'ArticleSidenotes',
    16 => 'Article - Sidenotes',
    17 => 'TeamMember',
    18 => 'Team - Member',
    19 => 'Team',
    20 => 'Client',
    21 => 'Organization',
    22 => 'Relation',
    23 => 'PortfolioProject',
    24 => 'Porfolio - Project',
    25 => 'Testimonial',
    26 => 'Review',
    27 => 'Endorsement',
  ),
  'header_background_img' => 
  array (
    0 => 'Home',
    1 => 'Homepage',
    2 => 'BasicOverview',
    3 => 'Basic - Overview',
    4 => 'BasicDetail',
    5 => 'Basic - Detail',
    6 => 'HeaderVertical',
    7 => 'Header - Vertical',
    8 => 'Publications',
    9 => 'Publications - Overview',
    10 => 'Blog',
    11 => 'ArticleTraditional',
    12 => 'Article - Traditional',
    13 => 'ArticleReadability',
    14 => 'Article - Readability',
    15 => 'ArticleSidenotes',
    16 => 'Article - Sidenotes',
    17 => 'TeamMember',
    18 => 'Team - Member',
    19 => 'Team',
    20 => 'Client',
    21 => 'Organization',
    22 => 'Relation',
    23 => 'PortfolioProject',
    24 => 'Porfolio - Project',
    25 => 'Testimonial',
    26 => 'Review',
    27 => 'Endorsement',
  ),
  'header_inheritance' => 
  array (
    0 => 'Home',
    1 => 'Homepage',
    2 => 'BasicOverview',
    3 => 'Basic - Overview',
    4 => 'BasicDetail',
    5 => 'Basic - Detail',
    6 => 'HeaderVertical',
    7 => 'Header - Vertical',
    8 => 'Publications',
    9 => 'Publications - Overview',
    10 => 'Blog',
    11 => 'ArticleTraditional',
    12 => 'Article - Traditional',
    13 => 'ArticleReadability',
    14 => 'Article - Readability',
    15 => 'ArticleSidenotes',
    16 => 'Article - Sidenotes',
    17 => 'TeamMember',
    18 => 'Team - Member',
    19 => 'Team',
    20 => 'Client',
    21 => 'Organization',
    22 => 'Relation',
    23 => 'PortfolioProject',
    24 => 'Porfolio - Project',
    25 => 'Testimonial',
    26 => 'Review',
    27 => 'Endorsement',
  ),
  'project_hub_timeline' => 
  array (
    0 => 'ProjectDashboard',
  ),
  'status_indicator' => 
  array (
    0 => 'Home',
    1 => 'Homepage',
    2 => 'BasicOverview',
    3 => 'Basic - Overview',
    4 => 'BasicDetail',
    5 => 'Basic - Detail',
    6 => 'HeaderVertical',
    7 => 'Header - Vertical',
    8 => 'Publications',
    9 => 'Publications - Overview',
    10 => 'Blog',
    11 => 'ArticleTraditional',
    12 => 'Article - Traditional',
    13 => 'ArticleReadability',
    14 => 'Article - Readability',
    15 => 'ArticleSidenotes',
    16 => 'Article - Sidenotes',
    17 => 'TeamMember',
    18 => 'Team - Member',
    19 => 'Team',
    20 => 'Client',
    21 => 'Organization',
    22 => 'Relation',
    23 => 'PortfolioProject',
    24 => 'Porfolio - Project',
    25 => 'Testimonial',
    26 => 'Review',
    27 => 'Endorsement',
  ),
  'status_improvements' => 
  array (
    0 => 'Home',
    1 => 'Homepage',
    2 => 'BasicOverview',
    3 => 'Basic - Overview',
    4 => 'BasicDetail',
    5 => 'Basic - Detail',
    6 => 'HeaderVertical',
    7 => 'Header - Vertical',
    8 => 'Publications',
    9 => 'Publications - Overview',
    10 => 'Blog',
    11 => 'ArticleTraditional',
    12 => 'Article - Traditional',
    13 => 'ArticleReadability',
    14 => 'Article - Readability',
    15 => 'ArticleSidenotes',
    16 => 'Article - Sidenotes',
    17 => 'TeamMember',
    18 => 'Team - Member',
    19 => 'Team',
    20 => 'Client',
    21 => 'Organization',
    22 => 'Relation',
    23 => 'PortfolioProject',
    24 => 'Porfolio - Project',
    25 => 'Testimonial',
    26 => 'Review',
    27 => 'Endorsement',
  ),
  'status_assigned_user' => 
  array (
    0 => 'Home',
    1 => 'Homepage',
    2 => 'BasicOverview',
    3 => 'Basic - Overview',
    4 => 'BasicDetail',
    5 => 'Basic - Detail',
    6 => 'HeaderVertical',
    7 => 'Header - Vertical',
    8 => 'Publications',
    9 => 'Publications - Overview',
    10 => 'Blog',
    11 => 'ArticleTraditional',
    12 => 'Article - Traditional',
    13 => 'ArticleReadability',
    14 => 'Article - Readability',
    15 => 'ArticleSidenotes',
    16 => 'Article - Sidenotes',
    17 => 'TeamMember',
    18 => 'Team - Member',
    19 => 'Team',
    20 => 'Client',
    21 => 'Organization',
    22 => 'Relation',
    23 => 'PortfolioProject',
    24 => 'Porfolio - Project',
    25 => 'Testimonial',
    26 => 'Review',
    27 => 'Endorsement',
  ),
  'status_help' => 
  array (
    0 => 'Home',
    1 => 'Homepage',
    2 => 'BasicOverview',
    3 => 'Basic - Overview',
    4 => 'BasicDetail',
    5 => 'Basic - Detail',
    6 => 'HeaderVertical',
    7 => 'Header - Vertical',
    8 => 'Publications',
    9 => 'Publications - Overview',
    10 => 'Blog',
    11 => 'ArticleTraditional',
    12 => 'Article - Traditional',
    13 => 'ArticleReadability',
    14 => 'Article - Readability',
    15 => 'ArticleSidenotes',
    16 => 'Article - Sidenotes',
    17 => 'TeamMember',
    18 => 'Team - Member',
    19 => 'Team',
    20 => 'Client',
    21 => 'Organization',
    22 => 'Relation',
    23 => 'PortfolioProject',
    24 => 'Porfolio - Project',
    25 => 'Testimonial',
    26 => 'Review',
    27 => 'Endorsement',
  ),
  'status_notes' => 
  array (
    0 => 'Home',
    1 => 'Homepage',
    2 => 'BasicOverview',
    3 => 'Basic - Overview',
    4 => 'BasicDetail',
    5 => 'Basic - Detail',
    6 => 'HeaderVertical',
    7 => 'Header - Vertical',
    8 => 'Publications',
    9 => 'Publications - Overview',
    10 => 'Blog',
    11 => 'ArticleTraditional',
    12 => 'Article - Traditional',
    13 => 'ArticleReadability',
    14 => 'Article - Readability',
    15 => 'ArticleSidenotes',
    16 => 'Article - Sidenotes',
    17 => 'TeamMember',
    18 => 'Team - Member',
    19 => 'Team',
    20 => 'Client',
    21 => 'Organization',
    22 => 'Relation',
    23 => 'PortfolioProject',
    24 => 'Porfolio - Project',
    25 => 'Testimonial',
    26 => 'Review',
    27 => 'Endorsement',
  ),
  'author_id' => 
  array (
    0 => 'ArticleTraditional',
    1 => 'ArticleReadability',
    2 => 'ArticleSidenotes',
    3 => 'Article - Traditional',
    4 => 'Article - Readability',
    5 => 'Article - Sidenotes',
  ),
  'comments_toggle' => 
  array (
    0 => 'ArticleTraditional',
    1 => 'ArticleReadability',
    2 => 'ArticleSidenotes',
    3 => 'Article - Traditional',
    4 => 'Article - Readability',
    5 => 'Article - Sidenotes',
  ),
  'rating_value' => 
  array (
    0 => 'Testimonial',
    1 => 'Review',
    2 => 'Endorsement',
  ),
  'contact_email' => 
  array (
    0 => 'TeamMember',
    1 => 'Team - Member',
    2 => 'Team',
  ),
  'contact_phone' => 
  array (
    0 => 'TeamMember',
    1 => 'Team - Member',
    2 => 'Team',
  ),
  'contact_mobile' => 
  array (
    0 => 'TeamMember',
    1 => 'Team - Member',
    2 => 'Team',
  ),
  'address_street_name' => 
  array (
    0 => 'PortfolioProject',
    1 => 'Porfolio - Project',
  ),
  'address_house_number' => 
  array (
    0 => 'PortfolioProject',
    1 => 'Porfolio - Project',
  ),
  'address_postal_code' => 
  array (
    0 => 'PortfolioProject',
    1 => 'Porfolio - Project',
  ),
  'address_locality' => 
  array (
    0 => 'PortfolioProject',
    1 => 'Porfolio - Project',
  ),
  'address_region' => 
  array (
    0 => 'PortfolioProject',
    1 => 'Porfolio - Project',
  ),
  'address_country' => 
  array (
    0 => 'PortfolioProject',
    1 => 'Porfolio - Project',
  ),
  'date_start' => 
  array (
    0 => 'PortfolioProject',
    1 => 'Porfolio - Project',
  ),
  'date_end' => 
  array (
    0 => 'PortfolioProject',
    1 => 'Porfolio - Project',
  ),
  'date_published' => 
  array (
    0 => 'PortfolioProject',
    1 => 'Porfolio - Project',
  ),
  'organization_logo_svg' => 
  array (
    0 => 'Client',
    1 => 'Organization',
    2 => 'Relation',
  ),
  'organization_logo_img' => 
  array (
    0 => 'Client',
    1 => 'Organization',
    2 => 'Relation',
  ),
  'organization_name' => 
  array (
    0 => 'Client',
    1 => 'Organization',
    2 => 'Relation',
  ),
  'organization_sector' => 
  array (
    0 => 'Client',
    1 => 'Organization',
    2 => 'Relation',
  ),
  'organization_industry' => 
  array (
    0 => 'Client',
    1 => 'Organization',
    2 => 'Relation',
  ),
  'organization_size' => 
  array (
    0 => 'Client',
    1 => 'Organization',
    2 => 'Relation',
  ),
  'organization_url' => 
  array (
    0 => 'Client',
    1 => 'Organization',
    2 => 'Relation',
  ),
  'person_image' => 
  array (
    0 => 'TeamMember',
    1 => 'Team - Member',
    2 => 'Team',
    3 => 'Testimonial',
    4 => 'Review',
    5 => 'Endorsement',
  ),
  'person_image_loose' => 
  array (
    0 => 'TeamMember',
    1 => 'Team - Member',
    2 => 'Team',
  ),
  'person_firstname' => 
  array (
    0 => 'TeamMember',
    1 => 'Team - Member',
    2 => 'Team',
    3 => 'Testimonial',
    4 => 'Review',
    5 => 'Endorsement',
  ),
  'person_lastname' => 
  array (
    0 => 'TeamMember',
    1 => 'Team - Member',
    2 => 'Team',
    3 => 'Testimonial',
    4 => 'Review',
    5 => 'Endorsement',
  ),
  'person_gender' => 
  array (
    0 => 'TeamMember',
    1 => 'Team - Member',
    2 => 'Team',
    3 => 'Testimonial',
    4 => 'Review',
    5 => 'Endorsement',
  ),
  'person_birthdate' => 
  array (
    0 => 'TeamMember',
    1 => 'Team - Member',
    2 => 'Team',
    3 => 'Testimonial',
    4 => 'Review',
    5 => 'Endorsement',
  ),
  'person_jobtitle' => 
  array (
    0 => 'TeamMember',
    1 => 'Team - Member',
    2 => 'Team',
    3 => 'Testimonial',
    4 => 'Review',
    5 => 'Endorsement',
  ),
  'person_url' => 
  array (
    0 => 'TeamMember',
    1 => 'Team - Member',
    2 => 'Team',
    3 => 'Testimonial',
    4 => 'Review',
    5 => 'Endorsement',
  ),
  'overview_img_landscape' => 
  array (
    0 => 'BasicOverview',
    1 => 'BasicDetail',
    2 => 'HeaderVertical',
    3 => 'Basic - Overview',
    4 => 'Basic - Detail',
    5 => 'Header - Vertical',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleReadability',
    9 => 'ArticleSidenotes',
    10 => 'Publications - Overview',
    11 => 'Article - Traditional',
    12 => 'Article - Readability',
    13 => 'Article - Sidenotes',
    14 => 'PortfolioProject',
    15 => 'Porfolio - Project',
  ),
  'overview_img_portrait' => 
  array (
    0 => 'BasicOverview',
    1 => 'BasicDetail',
    2 => 'HeaderVertical',
    3 => 'Basic - Overview',
    4 => 'Basic - Detail',
    5 => 'Header - Vertical',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleReadability',
    9 => 'ArticleSidenotes',
    10 => 'Publications - Overview',
    11 => 'Article - Traditional',
    12 => 'Article - Readability',
    13 => 'Article - Sidenotes',
    14 => 'PortfolioProject',
    15 => 'Porfolio - Project',
  ),
  'overview_img_square' => 
  array (
    0 => 'BasicOverview',
    1 => 'BasicDetail',
    2 => 'HeaderVertical',
    3 => 'Basic - Overview',
    4 => 'Basic - Detail',
    5 => 'Header - Vertical',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleReadability',
    9 => 'ArticleSidenotes',
    10 => 'Publications - Overview',
    11 => 'Article - Traditional',
    12 => 'Article - Readability',
    13 => 'Article - Sidenotes',
    14 => 'PortfolioProject',
    15 => 'Porfolio - Project',
  ),
  'overview_img_wide' => 
  array (
    0 => 'BasicOverview',
    1 => 'BasicDetail',
    2 => 'HeaderVertical',
    3 => 'Basic - Overview',
    4 => 'Basic - Detail',
    5 => 'Header - Vertical',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleReadability',
    9 => 'ArticleSidenotes',
    10 => 'Publications - Overview',
    11 => 'Article - Traditional',
    12 => 'Article - Readability',
    13 => 'Article - Sidenotes',
    14 => 'PortfolioProject',
    15 => 'Porfolio - Project',
  ),
  'overview_img_pano' => 
  array (
    0 => 'BasicOverview',
    1 => 'BasicDetail',
    2 => 'HeaderVertical',
    3 => 'Basic - Overview',
    4 => 'Basic - Detail',
    5 => 'Header - Vertical',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleReadability',
    9 => 'ArticleSidenotes',
    10 => 'Publications - Overview',
    11 => 'Article - Traditional',
    12 => 'Article - Readability',
    13 => 'Article - Sidenotes',
    14 => 'PortfolioProject',
    15 => 'Porfolio - Project',
  ),
  'overview_icon_svg' => 
  array (
    0 => 'BasicOverview',
    1 => 'BasicDetail',
    2 => 'HeaderVertical',
    3 => 'Basic - Overview',
    4 => 'Basic - Detail',
    5 => 'Header - Vertical',
  ),
  'overview_icon_font' => 
  array (
    0 => 'BasicOverview',
    1 => 'BasicDetail',
    2 => 'HeaderVertical',
    3 => 'Basic - Overview',
    4 => 'Basic - Detail',
    5 => 'Header - Vertical',
  ),
  'overview_link_text' => 
  array (
    0 => 'BasicOverview',
    1 => 'BasicDetail',
    2 => 'HeaderVertical',
    3 => 'Basic - Overview',
    4 => 'Basic - Detail',
    5 => 'Header - Vertical',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleReadability',
    9 => 'ArticleSidenotes',
    10 => 'Publications - Overview',
    11 => 'Article - Traditional',
    12 => 'Article - Readability',
    13 => 'Article - Sidenotes',
    14 => 'PortfolioProject',
    15 => 'Porfolio - Project',
  ),
  'overview_img_priority' => 
  array (
    0 => 'BasicOverview',
    1 => 'BasicDetail',
    2 => 'HeaderVertical',
    3 => 'Basic - Overview',
    4 => 'Basic - Detail',
    5 => 'Header - Vertical',
    6 => 'Publications',
    7 => 'ArticleTraditional',
    8 => 'ArticleReadability',
    9 => 'ArticleSidenotes',
    10 => 'Publications - Overview',
    11 => 'Article - Traditional',
    12 => 'Article - Readability',
    13 => 'Article - Sidenotes',
    14 => 'PortfolioProject',
    15 => 'Porfolio - Project',
  ),
  'social_twitter' => 
  array (
    0 => 'TeamMember',
    1 => 'Team - Member',
    2 => 'Team',
  ),
  'social_linkedin' => 
  array (
    0 => 'TeamMember',
    1 => 'Team - Member',
    2 => 'Team',
  ),
  'social_facebook' => 
  array (
    0 => 'TeamMember',
    1 => 'Team - Member',
    2 => 'Team',
  ),
  'social_instagram' => 
  array (
    0 => 'TeamMember',
    1 => 'Team - Member',
    2 => 'Team',
  ),
  'social_pinterest' => 
  array (
    0 => 'TeamMember',
    1 => 'Team - Member',
    2 => 'Team',
  ),
  'social_youtube' => 
  array (
    0 => 'TeamMember',
    1 => 'Team - Member',
    2 => 'Team',
  ),
  'social_googleplus' => 
  array (
    0 => 'TeamMember',
    1 => 'Team - Member',
    2 => 'Team',
  ),
  'social_github' => 
  array (
    0 => 'TeamMember',
    1 => 'Team - Member',
    2 => 'Team',
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