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
           name="[[+alias]][[+checkbox_array]]"
           id="[[+alias]]-[[+idx]]"
           class="hidden"
           value="[[+alias]]"
           tabindex="0"
           data-group="[[+collapse_target:isnot=``:then=`[[+alias]]`:default=`no-group`]]"
           data-target="[[+collapse_target:default=`no-target`]]"
           data-toggle="collapse"
           [[!+fb[[*id]].[[+alias]]:FormItIsChecked=`[[+alias]]`]]
           [[!#get.id:stripTags:eq=`[[+id]]`:then=`checked`]]>
    <label>[[+tag]]</label>
</div>