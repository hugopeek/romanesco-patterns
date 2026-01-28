[[+field_name_html:empty=`[[+field_name]]`:fbResetNonAlpha:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]
[[+field_option:fbResetNonAlpha:toPlaceholder=`option`]]
[[!If:toPlaceholder=`checkbox_array`?
    &subject=`[[+field_type]]`
    &operator=`is`
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

<div class="field">
    <div class="ui [[+collapse_target:isnot=``:then=`collapsible`]] [[+checkbox_variant]] checkbox">
        <input type="[[+field_type]]"
               name="[[+name]][[+checkbox_array]]"
               id="[[+name]]-[[+idx]]"
               value="[[+field_value:empty=`[[+option]]`]]"
               tabindex="[[+idx]]"
               data-group="[[+collapse_target:isnot=``:then=`[[+name]]`:default=`no-group`]]"
               data-target="[[+collapse_target:default=`no-target`]]"
               data-state="[[!+fb[[*id]].[[+name]]:contains=`[[+field_value:empty=`[[+option]]`]]`:then=`expanded`:else=`[[+collapse_default]]`]]"
               [[!+fb[[*id]].[[+name]]:FormItIsChecked=`[[+field_value:empty=`[[+option]]`]]`]]
               [[!+fb[[*id]].[[+name]]:contains=`[[+field_value:empty=`[[+option]]`]]`:then=`checked`]]>
        <label>[[+option]]</label>
    </div>
</div>
