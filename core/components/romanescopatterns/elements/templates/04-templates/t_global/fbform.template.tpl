[[*pagetitle:fbStripAsAlias:toPlaceholder=`title`]]

[[!FormIt?
    &hooks=`spam,email,[[*fb_autoresponder_toggle:eq=`1`:then=`FormItAutoResponder,`]][[++patternlab.fb_save_form:eq=`1`:then=`FormItSaveForm,`]]redirect`

    &emailTpl=`[[*fb_email_template:empty=`fbEmail`]]`
    &emailTo=`[[*fb_email_to_dynamic:empty=`[[*fb_email_to:empty=`[[++client_email:empty=`[[++emailsender]]`]]`]]`]]`
    &emailCC=`[[*fb_email_cc]]`
    &emailBCC=`[[*fb_email_bcc]]`
    &emailFrom=`[[*fb_email_from:empty=`[[++emailsender]]`]]`
    &emailFromName=`[[*fb_email_from_name:empty=`[[++site_name]]`]]`
    [[cbGetFieldContent:notempty=`&emailReplyTo=`[[+fb[[*id]]-email]]``? &field=`[[++patternlab.fb_input_email_id]]`]]
    &emailSubject=`[[*fb_email_subject:empty=`[[%formblocks.email.subject]]`]]`

    [[*fb_autoresponder_toggle:eq=`1`:then=`
    &fiarTpl=`fbAutoresponder`
    &fiarToField=`fb[[*id]]-email`
    &fiarFrom=`[[*fb_autoresponder_from:empty=`[[++emailsender]]`]]`
    &fiarFromName=`[[*fb_autoresponder_from_name:empty=`[[++site_name]]`]]`
    &fiarReplyTo=`[[*fb_autoresponder_reply_to:empty=`[[++client_email:empty=`[[++emailsender]]`]]`]]`
    &fiarSubject=`[[*fb_autoresponder_subject:empty=`[[%formblocks.autoresponder.subject]]`]]`
    `]]

    [[-&customValidators=`requiredIf,requiredIfNot`]]
    &validate=`
        [[!fbValidateProcessJSON? &json=`[[!fbEmailGetJSON? &formID=`[[*id]]`]]`]]
        [[cbGetFieldContent:notempty=`fb[[*id]]-email:email:required,`? &field=`[[++patternlab.fb_input_email_id]]`]]
        [[cbGetFieldContent:notempty=`fb[[*id]]-accept-terms:required,`? &field=`[[++patternlab.fb_accept_terms_id]]`]]
        [[$fbValidateCustomFields:notempty=`[[$fbValidateCustomFields]]`]]
        workemail:blank`
    &placeholderPrefix=`fb[[*id]].`
    &submitVar=`submit-[[+title]]`
    &redirectTo=`[[*fb_redirect_id]]`
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

<form id="form-[[+title]]" class="ui large form" name="fb[[*id]]" action="[[~[[+current_id]]]]" method="post" enctype="multipart/form-data">
    <input type="text" name="workemail" class="hidden" value="">

    <div class="ui [[+segment_type]]">
        [[*content]]

        <div class="ui [[+padding]] [[+segment_type:ne=`none`:then=`segment`]]">
            <input class="large primary ui button" type="submit" name="submit-[[+title]]" value="[[*fb_submit_button:default=`[[%formblocks.form.submit_button]]`]]">
        </div>
    </div>
</form>

[[fbLoadAssets]]