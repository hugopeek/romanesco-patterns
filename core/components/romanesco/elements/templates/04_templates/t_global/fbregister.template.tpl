[[*pagetitle:fbStripAsAlias:toPlaceholder=`title`]]

[[cbGetFieldContent:notempty=`1`:default=`0`:toPlaceholder=`math_question`?
    &field=`[[++formblocks.cb_math_question_id:empty=`-1`]]`
]]

[[!FormIt?
    &preHooks=`[[*fb_prehooks:notempty=`[[*fb_prehooks]]`]]`
    &placeholderPrefix=`fb[[*id]].`
]]
[[!Register?
    &preHooks=`[[*fb_hooks:notempty=`[[*fb_hooks]],`]][[+math_question:isnot=`0`:then=`math,`]]fbEmptyHook`
    &postHooks=`[[*fb_posthooks:notempty=`[[*fb_posthooks]]`]]`

    &activation=`[[*fb_activation_toggle:default=`1`]]`
    &activationttl=`[[*fb_activation_ttl:default=`180`]]`
    &activationEmailTpl=`[[*fb_activation_email:empty=`[[%formblocks.registration.email_content]]`]]`
    &activationEmailTplType=`inline`
    &activationEmailSubject=`[[*fb_email_subject:empty=`[[%formblocks.registration.email_subject]]`]]`

    &emailField=`fb[[*id]]-email`
    &usernameField=`fb[[*id]]-[[*fb_username_field:default=`username`:fbStripAsAlias:stripString=`fb[[*id]]-`]]`
    &fullnameField=`fb[[*id]]-[[*fb_fullname_field:default=`your-name`:fbStripAsAlias:stripString=`fb[[*id]]-`]]`
    &usergroups=`[[*fb_usergroups]]`
    [[*fb_usergroups_field:isnot=``:then=`&usergroupsField=`fb[[*id]]-[[*fb_usergroups_field:fbStripAsAlias:stripString=`fb[[*id]]-`]]``]]
    [[*fb_password_field:isnot=``:then=`&passwordField=`fb[[*id]]-[[*fb_password_field:fbStripAsAlias:stripString=`fb[[*id]]-`]]``:else=`&generatePassword=`1``]]
    &useExtended=`[[*fb_extended_toggle:default=`0`]]`

    [[!cbGetFieldContent?
        &field=`[[++formblocks.cb_math_question_id:empty=`-1`]]`
        &tpl=`fbMathQuestionProperties`
    ]]

    &customValidators=`[[$fbCustomValidators]]`
    &validate=`
        [[!fbValidateProcessJSON? &json=`[[!fbEmailGetJSON? &formID=`[[*id]]`]]`]]
        [[cbHasField? &field=`[[++formblocks.cb_input_email_id]]` &then=`fb[[*id]]-email:email:required,`]]
        [[cbHasField? &field=`[[++formblocks.cb_accept_terms_id]]` &then=`fb[[*id]]-accept-terms:required,`]]
        [[+math_question:isnot=`0`:then=`fb[[*id]]-math:required,`]]
        [[$fbValidateCustomFields]],
        website:blank`
    &validatePassword=`[[*fb_password_field:isnot=``:then=`1`:else=`0`]]`

    &errTpl=`<span class="help error">[[+error]]</span>`
    &placeholderPrefix=`fb[[*id]].`
    &submitVar=`submit-[[+title]]`
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

<form id="form-[[+title]]" class="ui [[+form_size]] [[+segment_type:eq=`none`:then=`basic`]] registration form" name="fb[[*id]]" action="[[~[[+current_id]]]]" method="post" enctype="multipart/form-data">
    <label for="website" class="hidden">If you're human, keep this field blank!</label>
    <input type="text" name="website" class="hidden" value="">

    <div class="ui [[+segment_type]]">
        [[*content]]

        [[*content:containsnot=`type="submit"`:then=`
        <div class="ui [[+padding]] [[+segment_type:ne=`none`:then=`segment`]]">
            <input class="[[+form_size]] primary ui button" type="submit" name="submit-[[+title]]" value="[[*fb_submit_button:default=`[[%formblocks.form.submit_button]]`]]">
        </div>
        `]]
    </div>
</form>