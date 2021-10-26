[[cbGetFieldContent:notempty=`1`:default=`0`:toPlaceholder=`upload_multiple`?
    &field=`[[++formblocks.cb_input_file_id:empty=`-1`]]`
    &fieldSettingFilter=`upload_limit!=1`
]]
[[cbGetFieldContent:notempty=`1`:default=`0`:toPlaceholder=`math_question`?
    &field=`[[++formblocks.cb_math_question_id:empty=`-1`]]`
]]
[[modifiedIf?
    &subject=`[[*fb_save_form]]`
    &operator=`EQ`
    &operand=`default`
    &then=`[[++formblocks.save_form]]`
    &else=`[[*fb_save_form]]`
    &toPlaceholder=`save_form`
]]

[[[[+multiple_steps:notempty=`
    !FormItRetriever?
        &placeholderPrefix=``
        &storeLocation=`session`
        &redirectToOnNotFound=`[[+first_step:isnot=`[[+current_id]]`:then=`[[+first_step]]`:else=``]]`
    `
]]]]
[[[[+multiple_steps:notempty=`
    !FormItRetriever?
        &placeholderPrefix=`fb[[*id]].`
        &storeLocation=`session`
        &redirectToOnNotFound=``
    `
]]]]
[[returnFirstHit:toPlaceholder=`redirect_to`?
    &1=`[[+redirect_id]]`
    &2=`[[+next_step]]`
    &3=`[[*fb_redirect_dynamic]]`
    &4=`[[*fb_redirect_id]]`
    &5=`[[++site_start]]`
]]

[[!FormIt?
    &preHooks=`
        [[+upload_multiple:eq=`1`:then=`Formit2AjaxUpload,`]]
        [[*fb_prehooks:notempty=`[[*fb_prehooks]],`]]
        fbEmptyHook
    `
    &hooks=`
        spam,
        [[+upload_multiple:eq=`1`:then=`AjaxUpload2Formit,AjaxUploadAttachments,`]]
        [[++formblocks.antispam_hooks:notempty=`[[++formblocks.antispam_hooks]],`]]
        [[+math_question:isnot=`0`:then=`math,`]]
        [[+save_form:eq=`1`:then=`FormItSaveForm,`]]
        [[*fb_hooks:notempty=`[[*fb_hooks]],`]]
        [[If? &subject=`[[*fb_email_to_dynamic:empty=`[[*fb_email_to]]`]]` &operator=`notempty` &then=`email,`]]
        [[*fb_autoresponder_toggle:eq=`1`:then=`FormItAutoResponder,`]]
        [[++formblocks.formsource:eq=`1`:then=`formsource_reset,`]]
        redirect
    `

    &emailTpl=`[[*fb_email_template:empty=`fbEmail`]]`
    &emailTo=`[[*fb_email_to_dynamic:empty=`[[*fb_email_to]]`]]`
    &emailCC=`[[*fb_email_cc]]`
    &emailBCC=`[[*fb_email_bcc]]`
    &emailFrom=`[[*fb_email_from:empty=`[[++emailsender]]`]]`
    &emailFromName=`[[*fb_email_from_name:empty=`[[++site_name]]`]]`
    &emailSubject=`[[*fb_email_subject:empty=`[[%formblocks.email.subject]]`]]`
    [[cbHasField? &field=`[[++formblocks.cb_input_email_id]]` &then=`&emailReplyTo=`[[+fb[[*id]]-email]]``]]

    [[cbGetFieldContent?
        &field=`[[++formblocks.cb_input_file_id:empty=`-1`]]`
        &fieldSettingFilter=`upload_limit!=1`
        &tpl=`fbFileUploadProperties`
    ]]
    [[cbGetFieldContent?
        &field=`[[++formblocks.cb_math_question_id:empty=`-1`]]`
        &tpl=`fbMathQuestionProperties`
    ]]

    [[++formblocks.antispam_hooks:contains=`recaptchav3`:then=`
    &recaptchav3.action_key=`fb[[*id]]`
    &recaptchav3.token_key=`token-[[*id]]`
    `]]

    [[*fb_autoresponder_toggle:eq=`1`:then=`
    &fiarTpl=`fbAutoresponder`
    &fiarToField=`fb[[*id]]-email`
    &fiarFrom=`[[*fb_autoresponder_from:empty=`[[++emailsender]]`]]`
    &fiarFromName=`[[*fb_autoresponder_from_name:empty=`[[++site_name]]`]]`
    &fiarReplyTo=`[[*fb_autoresponder_reply_to:empty=`[[++client_email:empty=`[[++emailsender]]`]]`]]`
    &fiarSubject=`[[*fb_autoresponder_subject:empty=`[[%formblocks.autoresponder.subject]]`]]`
    `]]

    &customValidators=`[[$fbCustomValidators]]`
    &validate=`
        [[!fbValidateProcessJSON? &formID=`[[*id]]`]]
        [[cbHasField? &field=`[[++formblocks.cb_input_email_id]]` &then=`fb[[*id]]-email:email:required,`]]
        [[cbHasField? &field=`[[++formblocks.cb_accept_terms_id]]` &then=`fb[[*id]]-accept-terms:required,`]]
        [[+math_question:isnot=`0`:then=`fb[[*id]]-math:required,`]]
        [[$fbValidateCustomFields]][[++formblocks.honeypot_field:notempty=`,
        fb[[*id]]-[[++formblocks.honeypot_field]]:blank`]]`
    &errTpl=`<span class="help error">[[+error]]</span>`
    &placeholderPrefix=`fb[[*id]].`
    &submitVar=`submit-[[*alias]]`
    &redirectTo=`[[+redirect_to]]`

    &store=`[[*fb_store_data:default=`0`]]`
    &storeTime=`[[*fb_store_time:default=`300`]]`
    &storeLocation=`session`
]]

[[!+fb[[*id]].validation_error_message:notempty=`
<div class="ui error message">
    <i class="close icon"></i>
    <div class="header">
        [[%formblocks.form.validation_error_heading]]
    </div>
    <p>[[%formblocks.form.validation_error_message]]</p>
</div>
`]]

<form id="form-[[*alias]]" class="ui [[+form_size]] [[+segment_type:eq=`none`:then=`basic`]] form" name="fb[[*id]]" action="[[~[[+current_id:empty=`0`]]]]" method="post" enctype="multipart/form-data">

    [[[[+multiple_steps:notempty=`!fbFormReport? &formID=`[[*id]][[+prev_forms:prepend=`,`]][[+next_forms:prepend=`,`]]` &tplPrefix=`fbStoreRow_``]]]]
    [[[[++formblocks.formsource:eq=`1`:then=`!formsource`]]]]

    <div class="ui [[+segment_type]]">

        [[*content]]

        [[- CUSTOM SUBMIT BUTTON
            If for some reason you need to add your own submit button to a form,
            you can do so in the form resource itself.
            Please keep in mind that the elements below will not be parsed if a
            submit button is found in the content area.
        ]]
        [[*content:containsnot=`type="submit"`:then=`
        <fieldset class="ui [[+padding]] [[+segment_type:isnot=`none`:then=`segment`]]">
            [[[[modifiedIf?
                &subject=`fbAntiSpamTheme`
                &operator=`iselement`
                &operand=`chunk`
                &then=`$fbAntiSpamTheme`
                &else=`$fbAntiSpam`
            ]]]]
            <div class="ui error message"></div>

            [[$fbSubmitButton[[+multiple_steps:notempty=`s`]]]]
        </fieldset>
        `]]
    </div>
</form>

[[!fbLoadAssets? &uploadFile=`[[+upload_multiple]]` &frontendValidation=`1`]]