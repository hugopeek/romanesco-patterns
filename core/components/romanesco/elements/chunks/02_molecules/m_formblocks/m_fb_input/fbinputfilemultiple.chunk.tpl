<div class="[[+field_layout:is=`inherit`:then=`[[+form_layout]]`:else=`[[+field_layout]]`]] file-upload field [[!If? &subject=`[[+fb[[*id]].error.fb[[*id]]-uploads]]` &operator=`notempty` &then=`error`]] [[If? &subject=`[[+field_required]]` &operator=`eq` &operand=`1` &then=`required`]]">
    <label>[[+field_name:stripWords=`[[$fbStripWordsLabel]]`]]</label>
    [[!AjaxUpload?
        &uid=`fb[[*id]]-uploads`
        &maxFiles=`[[+upload_limit]]`
        &maxFilesizeMb=`[[+max_file_size]]`
        &allowedExtensions=`[[+allowed_file_types]]`
        &thumbX=`150`
        &thumbY=`150`
        &addCss=`0`
    ]]
    [[+fb[[*id]].error.fb[[*id]]-uploads]]
    [[+field_helptext:notempty=`<span class="help">[[+field_helptext]]</span>`]]
</div>