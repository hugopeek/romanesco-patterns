[[cbGetFieldContent:notempty=`1`:default=`0`:toPlaceholder=`math_question`?
    &field=`[[++formblocks.cb_math_question_id:empty=`-1`]]`
]]

[[!FormIt?
    &preHooks=`[[*fb_prehooks:notempty=`[[*fb_prehooks]]`]]`
    &placeholderPrefix=`fb[[*id]].`
]]
[[!Register?
    &preHooks=`[[+math_question:isnot=`0`:then=`math,`]][[*fb_hooks:notempty=`[[*fb_hooks]],`]]fbEmptyHook`
    &postHooks=`[[*fb_posthooks:notempty=`[[*fb_posthooks]]`]]`

    &activation=`[[*fb_activation_toggle:default=`1`]]`
    &activationttl=`[[*fb_activation_ttl:default=`180`]]`
    &activationEmailTpl=`[[*fb_activation_email[[*fb_activation_email_type:isnot=`inline`:then=`_tpl`]]:empty=`[[%formblocks.registration.email_content]]`]]`
    &activationEmailTplType=`[[*fb_activation_email_type:default=`inline`]]`
    &activationEmailSubject=`[[*fb_email_subject:empty=`[[%formblocks.registration.email_subject]]`]]`

    &emailField=`fb[[*id]]-email` [[- Resist the temptation to make this dynamic. This value will be used to set the (mandatory) user email anyhow.]]
    &usernameField=`[[*fb_username_field:default=`username`:fbStripAsAlias:stripString=`fb[[*id]]-`:prepend=`fb[[*id]]-`]]`
    &fullnameField=`[[*fb_fullname_field:default=`fullname`:fbStripAsAlias:stripString=`fb[[*id]]-`:prepend=`fb[[*id]]-`]]`
    &usergroups=`[[*fb_usergroups]]`
    [[*fb_usergroups_field:isnot=``:then=`&usergroupsField=`fb[[*id]]-[[*fb_usergroups_field:fbStripAsAlias:stripString=`fb[[*id]]-`]]``]]
    [[*fb_password_field:isnot=``:then=`&passwordField=`fb[[*id]]-[[*fb_password_field:fbStripAsAlias:stripString=`fb[[*id]]-`]]``:else=`&generatePassword=`1``]]
    &useExtended=`[[*fb_extended_toggle:default=`0`]]`
    &excludeExtended=`fb[[*id]]-email-alt,fb[[*id]]-accept-terms,fb[[*id]]-math,fb[[*id]]-op1,fb[[*id]]-op2,fb[[*id]]-operator`

    [[!cbGetFieldContent?
        &field=`[[++formblocks.cb_math_question_id:empty=`-1`]]`
        &tpl=`fbMathQuestionProperties`
    ]]

    [[++formblocks.antispam_hooks:contains=`recaptchav3`:then=`
    &recaptchav3.action_key=`form_[[*id]]`
    `]]

    &customValidators=`[[$fbCustomValidators]]`
    &validate=`
        [[!fbValidateProcessJSON? &formID=`[[*id]]`]]
        [[cbHasField? &field=`[[++formblocks.cb_input_email_id]]` &then=`fb[[*id]]-email:email:required,`]]
        [[cbHasField? &field=`[[++formblocks.cb_accept_terms_id]]` &then=`fb[[*id]]-accept-terms:required,`]]
        [[+math_question:isnot=`0`:then=`fb[[*id]]-math:math,`]]
        [[[[modifiedIf?
            &subject=`fbValidateCustomFields`
            &operator=`iselement`
            &operand=`chunk`
            &then=`$fbValidateCustomFields`
        ]]]][[++formblocks.honeypot_field:notempty=`,
        fb[[*id]]-[[++formblocks.honeypot_field]]:blank`]]`
    &validatePassword=`[[*fb_password_field:isnot=``:then=`1`:else=`0`]]`

    &errTpl=`<span class="help error">[[+error]]</span>`
    &placeholderPrefix=`fb[[*id]].`
    &submitVar=`fb[[*id]]-submit`
    &successMsg=`[[%formblocks.registration.success_message]]`

    &activationResourceId=`[[*fb_activation_resource_id:empty=`[[++formblocks.activation_resource_id]]`]]`
    &submittedResourceId=`[[*fb_redirect_dynamic:empty=`[[*fb_redirect_id]]`]]`
]]

[[!+fb[[*id]].validation_error_message:notempty=`
<div class="ui error message">
    <i class="close icon"></i>
    <div class="header">
        [[%formblocks.registration.validation_error_heading]]
    </div>
    <p>[[%formblocks.registration.validation_error_message]]</p>
    <p>[[!+fb[[*id]].validation_error_message]]</p>
</div>
`]]

<form id="form-[[*alias]]" class="ui [[+form_size]] [[+segment_type:eq=`none`:then=`basic`]] registration form" name="fb[[*id]]" action="[[~[[+current_id:empty=`0`]]]]" method="post" enctype="multipart/form-data">
    <div class="ui [[+segment_type]]">

        [[*content]]

        [[*content:containsnot=`type="submit"`:then=`
        <div class="ui [[+padding]] [[+segment_type:ne=`none`:then=`segment`]]">
            [[[[modifiedIf?
                &subject=`fbAntiSpamTheme`
                &operator=`iselement`
                &operand=`chunk`
                &then=`$fbAntiSpamTheme`
                &else=`$fbAntiSpam`
            ]]]]
            <div class="ui error message"></div>

            [[$fbSubmitButton]]
        </div>
        `]]
    </div>
</form>

[[!fbLoadAssets? &frontendValidation=`1`]]