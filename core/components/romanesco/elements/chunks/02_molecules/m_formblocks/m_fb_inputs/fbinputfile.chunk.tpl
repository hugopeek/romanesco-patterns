[[+field_name:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]

<div class="field [[+field_layout]] [[!If? &subject=`[[+fb[[*id]].error.[[+name]]]]` &operator=`notempty` &then=`error`]] [[If? &subject=`[[+field_required]]` &operator=`EQ` &operand=`1` &then=`required`]]">
    <label for="[[+name]]">[[+field_name:stripWords=`[[$fbStripWordsLabel]]`]]</label>
    [[[[If?
        &subject=`[[+upload_multiple]]`
        &operator=`EQ`
        &operand=`1`
        &then=`$fbInputFileMultiple`
        &else=`$fbInputFileSingle`
    ]]]]
    [[+field_helptext:notempty=`<p class="help">[[+field_helptext]]</p>`]]
</div>