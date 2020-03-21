[[!fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name_updated`? &input=`[[+field_name]]`]]
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
           name="[[+name_updated]][[+checkbox_array]]"
           id="[[+name_updated]]-[[+idx]]"
           value="[[+pagetitle:fbStripNonAlpha]]"
           tabindex="[[+idx]]"
           data-group="[[+collapse_target:isnot=``:then=`[[+name_updated]]`:default=`no-group`]]"
           data-target="[[+collapse_target:default=`no-target`]]"
           data-state="[[+collapse_default]]"
           [[!+fb[[*id]].[[+name_updated]]:FormItIsChecked=`[[+pagetitle:fbStripNonAlpha]]`]]
           [[!#get.id:stripTags:eq=`[[+id]]`:then=`checked`]]>
    <label>[[+pagetitle]]</label>
</div>