[[+field_name:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]

<div class="[[If? &subject=`[[+field_required]]` &operator=`EQ` &operand=`1` &then=`required`]] [[+field_layout]] field [[!If? &subject=`[[+fb[[*id]].error.[[+name]]]]` &operator=`notempty` &then=`error`]]">
    <label for="[[+name]]">[[+field_name]]</label>
    <select name="[[+name]]" class="ui dropdown">
        [[If?
            &subject=`[[+option_placeholder]]`
            &operator=`notempty`
            &then=`<option selected="true" disabled="disabled">[[+option_placeholder]]</option>`
        ]]
        [[+rows]]
    </select>
    [[+field_helptext:notempty=`<p class="help">[[+field_helptext]]</p>`]]
</div>