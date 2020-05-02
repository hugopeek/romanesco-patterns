[[!fbStripAsAlias:fbPrefixOutput:toPlaceholder=`field_alias`? &input=`[[+field_name]]`]]
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

<div class="ui [[+checkbox_variant]] checkbox field">
    <input type="[[+field_type]]"
           name="[[+field_alias]][[+checkbox_array]]"
           id="[[+field_alias]]-[[+idx]]"
           value="[[+name:fbStripNonAlpha]]"
           tabindex="[[+idx]]"
           data-group="[[+collapse_target:isnot=``:then=`[[+field_alias]]`:default=`no-group`]]"
           data-target="[[+collapse_target:default=`no-target`]]"
           data-state="[[+collapse_default]]"
           [[!+fb[[*id]].[[+field_alias]]:FormItIsChecked=`[[+name:fbStripNonAlpha]]`]]
           [[!+fb[[*id]].[[+field_alias]]:contains=`[[+name]]`:then=`checked`]]
    >
    <label>[[+name]]</label>
</div>