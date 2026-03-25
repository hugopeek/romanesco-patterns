[[+field_name_html:empty=`[[+field_name]]`:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]

<div id="[[+name]]" class="[[+field_layout:is=`inherit`:then=`[[+form_layout]]`:else=`[[+field_layout]]`]] file-upload field [[!If? &subject=`[[!+fb[[*id]].error.[[*id:md5]][[+field_type_idx]]]]` &operator=`notempty` &then=`error`]] [[If? &subject=`[[+field_required]]` &operator=`eq` &operand=`1` &then=`required`]]">
    <label>[[+field_name:stripWords=`[[$fbStripWordsLabel]]`]]</label>
    [[!AjaxUpload?
        &maxFiles=`[[+upload_limit]]`
        &maxFileSize=`[[+max_file_size]]MB`
        &acceptedFileTypes=`[[+accepted_file_types:replaceRegex=`_[0-9]+`]]`
        &uploadSectionTpl=`fbInputFileMultipleRow`
        &placeholderPrefix=`fb[[*id]].`
        &addCss=`1`
        &showCredits=`0`
        &uid=`[[*id:md5]][[+field_type_idx]]`
    ]]
    [[+field_helptext:notempty=`<span class="help">[[+field_helptext]]</span>`]]
</div>