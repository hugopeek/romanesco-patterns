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
[[modifiedIf?
    &subject=`[[+previous_steps]][[+next_step]]`
    &operator=`notempty`
    &then=`1`
    &else=`0`
    &toPlaceholder=`multiple_steps`
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
        [[++formblocks.antispam:notempty=`[[++formblocks.antispam]],`]]
        [[+math_question:isnot=`0`:then=`math,`]]
        [[+save_form:eq=`1`:then=`FormItSaveForm,`]]
        [[*fb_hooks:notempty=`[[*fb_hooks]],`]]
        [[*fb_email_to:notempty=`email,`]]
        [[*fb_autoresponder_toggle:eq=`1`:then=`FormItAutoResponder,`]]
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
        [[$fbValidateCustomFields]],
        workemail:blank`
    &errTpl=`<span class="help error">[[+error]]</span>`
    &placeholderPrefix=`fb[[*id]].`
    &submitVar=`submit-[[*alias]]`
    &redirectTo=`[[+next_step:empty=`[[*fb_redirect_dynamic:empty=`[[*fb_redirect_id]]`]]`]]`

    [[+multiple_steps:eq=`1`:then=`
    &store=`[[*fb_store_data:default=`0`]]`
    &storeTime=`[[*fb_store_time:default=`300`]]`
    &storeLocation=`session`
    `]]
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
    <div class="ui [[+segment_type]]">

        [[*content]]

        <div class="ui hidden field segment">
            <label for="workemail">[[%formblocks.form.honeypot_field]]</label>
            <input type="text" name="workemail" value="[[!+fb[[*id]].workemail]]">
        </div>

        [[*content:containsnot=`type="submit"`:then=`
        <div class="ui [[+padding]] [[+segment_type:ne=`none`:then=`segment`]]">
            [[[[++formblocks.antispam:contains=`recaptchav2`:then=`!recaptchav2_render`]]]]
            [[!+fb[[*id]].error.recaptchav2_error:replace=`span==div`]]
            <div class="ui error message"></div>
            [[$fbSubmitButton[[+multiple-steps:eq=`1`:then=`s`]]]]
        </div>
        `]]
    </div>
</form>

[[fbLoadAssets? &uploadFile=`[[+upload_multiple]]`]]