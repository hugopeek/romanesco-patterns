<span vocab="http://schema.org/" typeof="Person">
    <meta property="name" content="[[+pagetitle]]">
    <meta property="jobTitle" content="[[+tv.team_member_jobtitle]]">
    [[If?
        &subject=`[[+tv.team_member_twitter]]`
        &operator=`notempty`
        &then=`[[$buttonSocialConnectTwitter? &classes=`[[+button_type]]` &title=`[[%patternlab.social.connect_twitter_person]]` &account=`[[+tv.team_member_twitter]]`]]`
    ]]
    [[If?
        &subject=`[[+tv.team_member_linkedin]]`
        &operator=`notempty`
        &then=`[[$buttonSocialConnectLinkedin? &classes=`[[+button_type]]` &title=`[[%patternlab.social.connect_linkedin_person]]` &account=`[[+tv.team_member_linkedin]]`]]`
    ]]
    [[If?
        &subject=`[[+tv.team_member_facebook]]`
        &operator=`notempty`
        &then=`[[$buttonSocialConnectFacebook? &classes=`[[+button_type]]` &title=`[[%patternlab.social.connect_facebook_person]]` &account=`[[+tv.team_member_facebook]]`]]`
    ]]
    [[If?
        &subject=`[[+tv.team_member_googleplus]]`
        &operator=`notempty`
        &then=`[[$buttonSocialConnectGoogleplus? &classes=`[[+button_type]]` &title=`[[%patternlab.social.connect_googleplus_person]]` &account=`[[+tv.team_member_googleplus]]`]]`
    ]]
</span>