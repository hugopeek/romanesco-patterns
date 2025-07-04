[[+field_name_html:empty=`[[+field_name]]`:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]
[[+field_helptext:notempty=`<span class="help">[[+field_helptext]]</span>`:toPlaceholder=`help`]]
[[!+fb[[*id]].[[+name]]:contains=`[[+option_other_value]]`:then=`checked`:toPlaceholder=`check_other`]]
[[!If:toPlaceholder=`checkbox_array`?
    &subject=`[[+field_type]]`
    &operator=`EQ`
    &operand=`checkbox`
    &then=`[]`
    &else=``
]]
[[!If:toPlaceholder=`checkbox_variant`?
    &subject=`[[+checkbox_type]]`
    &operator=`notempty`
    &then=`[[+checkbox_type]]`
    &else=`[[+field_type]]`
]]

<div id="[[+name]]" class="[[+option_layout:empty=`grouped`]] [[+field_layout:is=`inherit`:then=`[[+form_layout]]`:else=`[[+field_layout]]`]] [[+field_type]] fields [[If? &subject=`[[+field_required]]` &operator=`EQ` &operand=`1` &then=`required`]] [[!If? &subject=`[[+fb[[*id]].error.[[+name]]]]` &operator=`notempty` &then=`error`]]">
    <label for="[[+name]]">
        [[+field_name]]
    </label>

    [[+helptext_position:eq=`top`:then=`[[+help]]`]]

    [[+rows]]

    [[+option_other:is=`1`:then=`
    <div class="field">
        <div class="ui collapsible [[+checkbox_variant]] checkbox">
            <input type="[[+field_type]]"
                   name="[[+name]][[+checkbox_array]]"
                   id="[[+name]]-last"
                   class="hidden"
                   value="[[+option_other_value]]"
                   tabindex="[[+total:add=`1`]]"
                   data-group="no-group"
                   data-target="[[+name]]-other"
                   [[!+fb[[*id]].[[+name]]:FormItIsChecked=`[[+option_other_value]]`]]
                   [[+check_other]]>
            <label>[[+option_other_value]]</label>
        </div>
    </div>

    <div id="[[+name]]-other" class="field [[+check_other:is=``:then=`hidden`]]">
        <input type="text" name="[[+name]]-other" value="[[!+fb[[*id]].[[+name]]-other]]" placeholder="[[+option_placeholder:empty=`[[%formblocks.field.other_namely]]`]]">
    </div>
    `]]

    [[+fb[[*id]].error.[[+name]]]]
    [[+helptext_position:eq=`bottom`:then=`[[+help]]`]]
</div>