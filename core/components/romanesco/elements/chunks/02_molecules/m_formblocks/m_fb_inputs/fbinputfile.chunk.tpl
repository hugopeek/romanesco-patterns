[[+field_name:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]

<div class="file-upload field [[+form_layout:empty=`[[+field_layout]]`]] [[!If? &subject=`[[+fb[[*id]].error.[[+name]]]]` &operator=`notempty` &then=`error`]] [[If? &subject=`[[+field_required]]` &operator=`EQ` &operand=`1` &then=`required`]]">
    <label for="[[+name]]">[[+field_name:stripWords=`[[$fbStripWordsLabel]]`]]</label>
    [[[[If?
        &subject=`[[+upload_limit]]`
        &operator=`GT`
        &operand=`1`
        &then=`$fbInputFileMultiple`
        &else=`$fbInputFileSingle`
    ]]]]
    [[+fb[[*id]].error.[[+name]]]]
    [[+field_helptext:notempty=`<span class="help">[[+field_helptext]]</span>`]]
</div>