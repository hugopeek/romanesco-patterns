[[+field_name:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]
[[+field_option:fbResetNonAlpha:toPlaceholder=`option`]]

<div class="ui field [[+field_type]] checkbox">
    <input type="[[+field_type]]"
           name="[[+name]][[+field_type:is=`checkbox`:then=`[]`]]"
           id="[[+name]]-[[+idx]]"
           value="[[+option]]"
           class="[[+collapse_target:isnot=``:then=`collapse-[[+field_type]]`]]"
           tabindex="[[+idx]]"
           data-group="[[+collapse_target:isnot=``:then=`[[+name]]`:default=`no-group`]]"
           data-target="[[+collapse_target:default=`no-target`]]"
           data-toggle="collapse"
           [[!+fb[[*id]].[[+name]]:FormItIsChecked=`[[+field_option]]`]]>
    <label>[[+option]]</label>
</div>