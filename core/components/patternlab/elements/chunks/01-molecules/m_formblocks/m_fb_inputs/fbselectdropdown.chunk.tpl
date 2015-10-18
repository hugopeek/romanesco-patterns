[[+field_name:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]

<div class="field [[+field_layout]] [[!If? &subject=`[[+fb[[*id]].error.[[+name]]]]` &operator=`notempty` &then=`error`]] [[If? &subject=`[[+field_required]]` &operator=`EQ` &operand=`1` &then=`required`]]">
    <label for="[[+name]]">[[+field_name]]</label>
    <select name="[[+name]]" class="ui dropdown">
        [[If?
            &subject=`[[+field_default]]`
            &operator=`notempty`
            &then=`<option selected="true" disabled="disabled">[[+field_default]]</option>`
        ]]
        [[+rows]]
    </select>
    [[+field_helptext:notempty=`<p class="help">[[+field_helptext]]</p>`]]
</div>