<span vocab="http://schema.org/" typeof="Person">
    <meta property="name" content="[[+pagetitle]]">
    <meta property="jobTitle" content="[[+person_jobtitle]]">
    [[[[If?
        &subject=`[[+social_twitter]]`
        &operator=`notempty`
        &then=`$buttonSocialConnectTwitter? &classes=`[[+button_type]]` &title=`[[%romanesco.social.connect_twitter_person]]` &account=`[[+social_twitter]]``
    ]]]]
    [[[[If?
        &subject=`[[+social_linkedin]]`
        &operator=`notempty`
        &then=`$buttonSocialConnectLinkedin? &classes=`[[+button_type]]` &title=`[[%romanesco.social.connect_linkedin_person]]` &account=`[[+social_linkedin]]``
    ]]]]
    [[[[If?
        &subject=`[[+social_facebook]]`
        &operator=`notempty`
        &then=`$buttonSocialConnectFacebook? &classes=`[[+button_type]]` &title=`[[%romanesco.social.connect_facebook_person]]` &account=`[[+social_facebook]]``
    ]]]]
    [[[[If?
        &subject=`[[+social_googleplus]]`
        &operator=`notempty`
        &then=`$buttonSocialConnectGoogleplus? &classes=`[[+button_type]]` &title=`[[%romanesco.social.connect_googleplus_person]]` &account=`[[+social_googleplus]]``
    ]]]]
</span>