[[+field_name_html:empty=`[[+field_name]]`:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]
[[+field_type:contains=`multiple`:then=`multiple`:toPlaceholder=`multiple`]]
[[modifiedIf?
    &subject=`[[+multiple]][[+option_other]]`
    &operator=`eq`
    &operand=`1`
    &then=`1`
    &else=`0`
    &toPlaceholder=`show_other`
]]

<div class="[[If? &subject=`[[+field_required]]` &operator=`EQ` &operand=`1` &then=`required`]] [[+field_layout:is=`inherit`:then=`[[+form_layout]]`:else=`[[+field_layout]]`]] field [[!If? &subject=`[[+fb[[*id]].error.[[+name]]]]` &operator=`notempty` &then=`error`]]">
    <label for="[[+name]]">[[+field_name]]</label>
    <select name="[[+name]][[+multiple:notempty=`[]`]]" id="[[+name]]" class="ui [[+field_type:empty=`dropdown`]] [[+option_other:is=`1`:then=`with other`]]" [[+multiple]]>
        <option value="">[[+option_placeholder]]</option>
        [[+rows]]
        [[+show_other:is=`1`:then=`
        <option value="[[+option_other_value]]"
             [[!+fb[[*id]].[[+name]]:FormItIsSelected=`[[+option_other_value]]`]]>
            [[+option_other_value]]
        </option>
        `]]
    </select>
    [[+show_other:is=`1`:then=`
    <div id="[[+name]]-other" class="other [[+check_other:is=``:then=`hidden`]]">
        <input type="text" name="[[+name]]-other" value="[[!+fb[[*id]].[[+name]]-other]]" placeholder="[[+option_other_value]]">
    </div>
    `]]
    [[+fb[[*id]].error.[[+name]]]]
    [[+field_helptext:notempty=`<span class="help">[[+field_helptext]]</span>`]]
</div>