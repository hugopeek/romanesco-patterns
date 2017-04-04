[[+field_name:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]
[[+field_option:fbResetNonAlpha:toPlaceholder=`option`]]

<div class="ui [[+collapse_target:isnot=``:then=`collapsible`]] [[+checkbox_type:empty=`[[+field_type]]`]] checkbox field">
    <input type="[[+field_type]]"
           name="[[+name]][[+field_type:is=`checkbox`:then=`[]`]]"
           id="[[+name]]-[[+idx]]"
           value="[[+option]]"
           tabindex="[[+idx]]"
           data-group="[[+collapse_target:isnot=``:then=`[[+name]]`:default=`no-group`]]"
           data-target="[[+collapse_target:default=`no-target`]]"
           data-state="[[+collapse_default]]"
           [[!+fb[[*id]].[[+name]]:FormItIsChecked=`[[+field_option]]`]]>
    <label>[[+option]]</label>
</div>