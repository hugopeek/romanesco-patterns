<span vocab="http://schema.org/" typeof="Person">
    <meta property="name" content="[[+pagetitle]]">
    <meta property="jobTitle" content="[[+tv.person_jobtitle]]">
    [[If?
        &subject=`[[+tv.person_twitter]]`
        &operator=`notempty`
        &then=`[[$buttonSocialConnectTwitter? &classes=`[[+button_type]]` &title=`[[%patternlab.social.connect_twitter_person]]` &account=`[[+tv.person_twitter]]`]]`
    ]]
    [[If?
        &subject=`[[+tv.person_linkedin]]`
        &operator=`notempty`
        &then=`[[$buttonSocialConnectLinkedin? &classes=`[[+button_type]]` &title=`[[%patternlab.social.connect_linkedin_person]]` &account=`[[+tv.person_linkedin]]`]]`
    ]]
    [[If?
        &subject=`[[+tv.person_facebook]]`
        &operator=`notempty`
        &then=`[[$buttonSocialConnectFacebook? &classes=`[[+button_type]]` &title=`[[%patternlab.social.connect_facebook_person]]` &account=`[[+tv.person_facebook]]`]]`
    ]]
    [[If?
        &subject=`[[+tv.person_googleplus]]`
        &operator=`notempty`
        &then=`[[$buttonSocialConnectGoogleplus? &classes=`[[+button_type]]` &title=`[[%patternlab.social.connect_googleplus_person]]` &account=`[[+tv.person_googleplus]]`]]`
    ]]
</span>