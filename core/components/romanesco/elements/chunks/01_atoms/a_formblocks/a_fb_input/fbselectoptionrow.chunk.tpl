[[+field_name_html:empty=`[[+field_name]]`:fbResetNonAlpha:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]
[[+field_option:fbResetNonAlpha:toPlaceholder=`option`]]

<div class="field">
    <div class="ui [[+collapse_target:isnot=``:then=`collapsible`]] [[+checkbox_type:empty=`[[+field_type]]`]] checkbox">
        <input type="[[+field_type]]"
               name="[[+name]][[+field_type:is=`checkbox`:then=`[]`]]"
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
