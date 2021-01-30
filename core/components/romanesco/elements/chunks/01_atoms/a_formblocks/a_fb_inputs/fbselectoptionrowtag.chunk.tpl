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

<div class="field">
    <div class="ui [[+checkbox_variant]] checkbox">
        <input type="[[+field_type]]"
               name="[[+alias]][[+checkbox_array]]"
               id="[[+alias]]-[[+idx]]"
               class="hidden"
               value="[[+alias]]"
               tabindex="[[+idx]]"
               data-group="[[+collapse_target:isnot=``:then=`[[+alias]]`:default=`no-group`]]"
               data-target="[[+collapse_target:default=`no-target`]]"
               data-state="[[+collapse_default]]"
               [[!+fb[[*id]].[[+alias]]:FormItIsChecked=`[[+alias]]`]]
               [[!#get.id:stripTags:eq=`[[+id]]`:then=`checked`]]>
        <label>[[+tag]]</label>
    </div>
</div>
