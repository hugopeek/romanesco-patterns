[[+field_name:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]

<div class="[[If? &subject=`[[+field_required]]` &operator=`EQ` &operand=`1` &then=`required`]] [[+form_layout:empty=`[[+field_layout]]`]] field [[!If? &subject=`[[+fb[[*id]].error.[[+name]]]]` &operator=`notempty` &then=`error`]]">
    <label for="[[+name]]">[[+field_name]]</label>
    <select name="[[+name]]" class="ui dropdown">
        [[If?
            &subject=`[[+option_placeholder]]`
            &operator=`notempty`
            &then=`<option selected="true" disabled="disabled">[[+option_placeholder]]</option>`
        ]]
        [[+rows]]
    </select>
    [[+fb[[*id]].error.[[+name]]]]
    [[+field_helptext:notempty=`<span class="help">[[+field_helptext]]</span>`]]
</div>