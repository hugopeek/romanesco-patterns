[[+field_name:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]

<div id="[[+name]]" class="[[+field_cols]] [[If? &subject=`[[+field_required]]` &operator=`EQ` &operand=`1` &then=`required`]] equal width date range fields">
    <div class="field [[+field_layout:is=`inherit`:then=`[[+form_layout]]`:else=`[[+field_layout]]`]] [[!If? &subject=`[[+fb[[*id]].error.fb[[*id]]-range-start]]` &operator=`notempty` &then=`error`]]">
        <label for="[[+name]]-start">[[+label_start]]</label>
        <div class="ui calendar date range start">
            <div class="ui input left icon">
                <i class="calendar alternate outline icon"></i>
                <input type="text" name="[[+name]]-start" id="[[+name]]-start" value="[[!+fb[[*id]].[[+name]]-start]]" placeholder="[[+placeholder_start]]">
            </div>
        </div>
    </div>
    <div class="field [[+field_layout:is=`inherit`:then=`[[+form_layout]]`:else=`[[+field_layout]]`]] [[!If? &subject=`[[+fb[[*id]].error.[[+name]]-end]]` &operator=`notempty` &then=`error`]]">
        <label for="[[+name]]-end">[[+label_end]]</label>
        <div class="ui calendar date range end">
            <div class="ui input left icon">
                <i class="calendar alternate outline icon"></i>
                <input type="text" name="[[+name]]-end" id="[[+name]]-end" value="[[!+fb[[*id]].[[+name]]-end]]" placeholder="[[+placeholder_end]]">
            </div>
        </div>
    </div>
</div>

[[+field_helptext:notempty=`<div class="help">[[+field_helptext]]</div>`]]
