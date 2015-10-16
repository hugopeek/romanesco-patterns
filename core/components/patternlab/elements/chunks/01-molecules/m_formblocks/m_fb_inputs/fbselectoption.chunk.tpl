[[+field_name:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]

<div id="[[+name]]" class="grouped fields">
    <label for="[[+name]]">[[+field_name]]</label>

    [[+rows]]

    [[+option_other:is=`1`:then=`
    <div class="ui field [[+field_type]] checkbox other [[!If? &subject=`[[+fb[[*id]].error.[[+name]]]]` &operator=`notempty` &then=`error`]]">
        <input type="[[+field_type]]"
               name="[[+name]][[+field_type:is=`checkbox`:then=`[]`]]"
               id="[[+name]]-last"
               class="hidden collapse-other"
               value="[[+option_other_value]]"
               tabindex="0"
               data-group="no-group"
               data-target="[[+name]]-other"
               [[!+fb[[*id]].[[+name]]:FormItIsChecked=`[[+option_other_value]]`]]
                >
        <label>[[+option_other_value]]</label>

        <div id="[[+name]]-other" class="field collapse">
            <input type="text" name="[[+name]]-other" value="[[!+fb[[*id]].[[+name]]-other]]" placeholder="[[+option_other_placeholder]]">
        </div>
    </div>
    `]]

    [[+field_helptext:notempty=`<p class="help">[[+field_helptext]]</p>`]]
</div>