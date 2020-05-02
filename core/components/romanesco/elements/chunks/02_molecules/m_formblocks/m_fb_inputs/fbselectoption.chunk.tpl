[[+field_name:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]
[[+field_helptext:notempty=`<span class="help">[[+field_helptext]]</span>`:toPlaceholder=`help`]]
[[!+fb[[*id]].[[+name]]:contains=`[[+option_other_value]]`:then=`checked`:toPlaceholder=`check_other`]]

<div id="[[+name]]" class="[[If? &subject=`[[+field_required]]` &operator=`EQ` &operand=`1` &then=`required`]] [[+option_layout:empty=`grouped`]] [[+field_layout:is=`inherit`:then=`[[+form_layout]]`:else=`[[+field_layout]]`]] [[+field_type]] fields [[!If? &subject=`[[+fb[[*id]].error.[[+name]]]]` &operator=`notempty` &then=`error`]]">
    <label for="[[+name]]">
        [[+field_name]]
        [[+helptext_position:eq=`top`:then=`[[+fb[[*id]].error.[[+name]]]] [[+help]]`]]
    </label>

    [[+rows]]

    [[+option_other:is=`1`:then=`
    <div class="ui collapsible [[+checkbox_type:empty=`[[+field_type]]`]] checkbox field">
        <input type="[[+field_type]]"
               name="[[+name]][[+field_type:is=`checkbox`:then=`[]`]]"
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
    <div id="[[+name]]-other" class="field [[+check_other:is=``:then=`hidden`]]">
        <input type="text" name="[[+name]]-other" value="[[!+fb[[*id]].[[+name]]-other]]" placeholder="[[+option_placeholder]]">
    </div>
    `]]

    [[+helptext_position:eq=`bottom`:then=`[[+fb[[*id]].error.[[+name]]]] [[+help]]`]]
</div>