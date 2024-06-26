[[!fbLoadAssets?
    &uploadFile=`[[cbHasField? &field=`[[++formblocks.cb_input_file_multiple_id]]`]]`
    &frontendValidation=`1`
]][[modifiedIf?
    &subject=`[[*fb_save_form]]`
    &operator=`EQ`
    &operand=`default`
    &then=`[[++formblocks.save_form]]`
    &else=`[[*fb_save_form]]`
    &toPlaceholder=`save_form`
]][[[[+multiple_steps:notempty=`
    !FormItRetriever?
        &placeholderPrefix=``
        &storeLocation=`session`
        &redirectToOnNotFound=`[[+first_step:isnot=`[[+current_id]]`:then=`[[+first_step]]`:else=``]]`
    `
]]]][[returnFirstHit:toPlaceholder=`redirect_to`?
    &1=`[[+redirect_id:empty=``]]`
    &2=`[[+next_step:empty=``]]`
    &3=`[[*fb_redirect_dynamic:empty=``]]`
    &4=`[[*fb_redirect_id:empty=``]]`
    &5=`[[++site_start:empty=``]]`
]][[!FormIt?
    &preHooks=`
        [[cbHasField? &field=`[[++formblocks.cb_input_file_multiple_id]]` &then=`Formit2AjaxUpload,`]]
        [[+multiple_steps:notempty=`fbSetStoredValues,`]]
        [[*fb_prehooks:append=`,`]]
        fbEmptyHook
    `
    &renderHooks=`[[*fb_renderhooks]]`
    &hooks=`
        spam,
        [[cbHasField? &field=`[[++formblocks.cb_input_file_multiple_id]]` &then=`AjaxUpload2Formit,AjaxUploadAttachments,`]]
        [[cbGetFieldContent:notempty=`AjaxUploadRequired,`? &field=`[[++formblocks.cb_input_file_multiple_id:empty=`-1`]]` &fieldSettingFilter=`field_required==1`]]
        [[cbHasField? &field=`[[++formblocks.cb_input_file_id]]` &then=`fbProcessUploads,`]]
        [[cbHasField? &field=`[[++formblocks.cb_math_question_id]]` &then=`math,`]]
        [[++romanesco.dev_mode:isnot=`1`:then=`[[++formblocks.antispam_hooks:append=`,`]]`]]
        [[+save_form:eq=`1`:then=`FormItSaveForm,`]]
        [[*fb_hooks:append=`,`]]
        [[If? &subject=`[[*fb_email_to_dynamic:empty=`[[*fb_email_to]]`]]` &operator=`notempty` &then=`email,`]]
        [[*fb_store_attachments:replace=`default==[[++formblocks.store_attachments]]`:isnot=`1`:then=`AjaxUploadRemove,`]]
        [[*fb_autoresponder_toggle:eq=`1`:then=`FormItAutoResponder,`]]
        [[++formblocks.formsource:eq=`1`:then=`formsource_reset,`]]
        fbEmptyHook
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
        &field=`[[++formblocks.cb_input_file_multiple_id:empty=`-1`]]`
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
        [[cbHasField? &field=`[[++formblocks.cb_math_question_id]]` &then=`fb[[*id]]-math:required,`]]
        [[[[modifiedIf?
            &subject=`fbValidateCustomFields`
            &operator=`iselement`
            &operand=`chunk`
            &then=`$fbValidateCustomFields`
        ]]]][[++formblocks.honeypot_field:notempty=`,
        fb[[*id]]-[[++formblocks.honeypot_field]]:blank`]]`
    &placeholderPrefix=`fb[[*id]].`

    &validationErrorBulkFormatJson=`1`
    &validationErrorMessage=`{"success":false,"errors":[[+errors]]}`
    &hookErrorJsonOutputPlaceholder=`hook_error_placeholder`
    &errTpl=`[[+error]]`

    &successMessage=`{
        "success":true
        ,"message":"[[%formblocks.form.success_message]]"
        [[+redirect_to:notempty=`,"redirect":"[[~[[+redirect_to]]? &scheme=`full`]]"`]]
    }`
    &successMessagePlaceholder=`fb[[*id]].success_message`

]][[!+fb[[*id]].validation_error_message]][[!+fb[[*id]].success_message]]