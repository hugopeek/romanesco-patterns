[[+field_name:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]

<div class="[[If? &subject=`[[+field_required]]` &operator=`EQ` &operand=`1` &then=`required`]] [[+field_layout:is=`inherit`:then=`[[+form_layout]]`:else=`[[+field_layout]]`]] field [[!If? &subject=`[[+fb[[*id]].error.[[+name]]]]` &operator=`notempty` &then=`error`]]">
    <label for="[[+name]]">[[+field_name]]</label>
    <select name="[[+name]]" class="ui [[+field_type:empty=`dropdown`]]">
        <option value="">[[+option_placeholder]]</option>
        [[+rows]]
    </select>
    [[+fb[[*id]].error.[[+name]]]]
    [[+field_helptext:notempty=`<span class="help">[[+field_helptext]]</span>`]]
</div>