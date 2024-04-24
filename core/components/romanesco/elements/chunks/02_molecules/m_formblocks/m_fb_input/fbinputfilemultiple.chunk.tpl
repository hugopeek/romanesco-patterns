[[+field_name_html:empty=`[[+field_name]]`:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]

<div class="[[+field_layout:is=`inherit`:then=`[[+form_layout]]`:else=`[[+field_layout]]`]] file-upload field [[!If? &subject=`[[+fb[[*id]].error.[[+name]]]]` &operator=`notempty` &then=`error`]] [[If? &subject=`[[+field_required]]` &operator=`EQ` &operand=`1` &then=`required`]]">
    <label>[[+field_name:stripWords=`[[$fbStripWordsLabel]]`]]</label>
    [[!AjaxUpload?
        &uid=`[[+name]]`
        &maxFiles=`[[+upload_limit]]`
        &maxFilesizeMb=`[[+max_file_size]]`
        &allowedExtensions=`[[+allowed_file_types]]`
        &thumbX=`150`
        &thumbY=`150`
        &addCss=`0`
    ]]
    [[+fb[[*id]].error.[[+name]]]]
    [[+field_helptext:notempty=`<span class="help">[[+field_helptext]]</span>`]]
</div>