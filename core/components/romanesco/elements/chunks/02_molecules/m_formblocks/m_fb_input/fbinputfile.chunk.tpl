[[+field_name_html:empty=`[[+field_name]]`:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]

<div class="[[+field_layout:is=`inherit`:then=`[[+form_layout]]`:else=`[[+field_layout]]`]] file-upload field [[!If? &subject=`[[+fb[[*id]].error.[[+name]]]]` &operator=`notempty` &then=`error`]] [[If? &subject=`[[+field_required]]` &operator=`EQ` &operand=`1` &then=`required`]]">
    <label for="[[+name]]">[[+field_name:stripWords=`[[$fbStripWordsLabel]]`]]</label>
    [[[[If?
        &subject=`[[+upload_limit]]`
        &operator=`GT`
        &operand=`1`
        &then=`$fbInputFileMultiple`
    ]]]]
    [[!If?
        &subject=`[[+upload_limit]]`
        &operator=`EQ`
        &operand=`1`
        &then=`<input type="file" name="[[+name]]" id="[[+name]]">`
    ]]
    [[+fb[[*id]].error.[[+name]]]]
    [[+field_helptext:notempty=`<span class="help">[[+field_helptext]]</span>`]]
</div>