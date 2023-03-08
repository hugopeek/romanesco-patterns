[[+field_name_html:empty=`[[+field_name]]`:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]

<div id="[[+name]]" class="[[+field_cols]] [[If? &subject=`[[+field_required]]` &operator=`EQ` &operand=`1` &then=`required`]] equal width [[++cultureKey]] date range fields">
    <input type="hidden" name="field_name" value="[[+field_name]]">
    <input type="hidden" name="label_start" value="[[+label_start]]">
    <input type="hidden" name="label_end" value="[[+label_end]]">
    <div class="[[+field_layout:is=`inherit`:then=`[[+form_layout]]`:else=`[[+field_layout]]`]] field [[!If? &subject=`[[+fb[[*id]].error.[[+name]]-start]]` &operator=`notempty` &then=`error`]]">
        <label for="[[+name]]-start">[[+label_start]]</label>
        <div class="ui calendar date range start">
            <div class="ui input left icon">
                <i class="calendar alternate outline icon"></i>
                <input type="text" name="[[+name]]-start" id="[[+name]]-start" value="[[!+fb[[*id]].[[+name]]-start]]" placeholder="[[+placeholder_start]]">
            </div>
        </div>
        [[+fb[[*id]].error.[[+name]]-start]]
    </div>
    <div class="[[+field_layout:is=`inherit`:then=`[[+form_layout]]`:else=`[[+field_layout]]`]] field [[!If? &subject=`[[+fb[[*id]].error.[[+name]]-end]]` &operator=`notempty` &then=`error`]]">
        <label for="[[+name]]-end">[[+label_end]]</label>
        <div class="ui calendar date range end">
            <div class="ui input left icon">
                <i class="calendar alternate outline icon"></i>
                <input type="text" name="[[+name]]-end" id="[[+name]]-end" value="[[!+fb[[*id]].[[+name]]-end]]" placeholder="[[+placeholder_end]]">
            </div>
        </div>
        [[+fb[[*id]].error.[[+name]]-end]]
    </div>
</div>

[[+field_helptext:notempty=`<div class="help">[[+field_helptext]]</div>`]]
