<span class="social connect buttons" vocab="https://schema.org/" typeof="Person">
    <meta property="name" content="[[+person_firstname]] [[+person_lastname]]">
    <meta property="jobTitle" content="[[+person_jobtitle]]">
    [[[[If?
        &subject=`[[+social_twitter]]`
        &operator=`notempty`
        &then=`$buttonSocialConnectTwitter? &classes=`[[+button_size]] [[+button_type]]` &title=`[[%romanesco.social.connect_twitter_person]]` &account=`[[+social_twitter]]``
    ]]]]
    [[[[If?
        &subject=`[[+social_linkedin]]`
        &operator=`notempty`
        &then=`$buttonSocialConnectLinkedin? &classes=`[[+button_size]] [[+button_type]]` &title=`[[%romanesco.social.connect_linkedin_person]]` &account=`[[+social_linkedin]]``
    ]]]]
    [[[[If?
        &subject=`[[+social_facebook]]`
        &operator=`notempty`
        &then=`$buttonSocialConnectFacebook? &classes=`[[+button_size]] [[+button_type]]` &title=`[[%romanesco.social.connect_facebook_person]]` &account=`[[+social_facebook]]``
    ]]]]
    [[[[If?
        &subject=`[[+social_instagram]]`
        &operator=`notempty`
        &then=`$buttonSocialConnectInstagram? &classes=`[[+button_size]] [[+button_type]]` &title=`[[%romanesco.social.connect_instagram_person]]` &account=`[[+social_instagram]]``
    ]]]]
    [[[[If?
        &subject=`[[+social_pinterest]]`
        &operator=`notempty`
        &then=`$buttonSocialConnectPinterest? &classes=`[[+button_size]] [[+button_type]]` &title=`[[%romanesco.social.connect_pinterest_person]]` &account=`[[+social_pinterest]]``
    ]]]]
    [[[[If?
        &subject=`[[+social_youtube]]`
        &operator=`notempty`
        &then=`$buttonSocialConnectYoutube? &classes=`[[+button_size]] [[+button_type]]` &title=`[[%romanesco.social.connect_youtube_person]]` &account=`[[+social_youtube]]``
    ]]]]
    [[[[If?
        &subject=`[[+social_whatsapp]]`
        &operator=`notempty`
        &then=`$buttonSocialConnectWhatsapp? &classes=`[[+button_size]] [[+button_type]]` &title=`[[%romanesco.social.connect_whatsapp_person]]` &account=`[[+social_whatsapp]]` &text=`[[+social_whatsapp_text]]``
    ]]]]
    [[[[If?
        &subject=`[[+social_github]]`
        &operator=`notempty`
        &then=`$buttonSocialConnectGithub? &classes=`[[+button_size]] [[+button_type]]` &title=`[[%romanesco.social.connect_github_person]]` &account=`[[+social_github]]``
    ]]]]
</span>