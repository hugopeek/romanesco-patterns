[[+field_name:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]

<div class="two [[If? &subject=`[[+field_required]]` &operator=`EQ` &operand=`1` &then=`required`]] fields">
    <div class="field [[+field_layout:is=`inherit`:then=`[[+form_layout]]`:else=`[[+field_layout]]`]] [[!If? &subject=`[[+fb[[*id]].error.fb[[*id]]-range-start]]` &operator=`notempty` &then=`error`]]">
        <label>Start</label>
        <div class="ui calendar date range start">
            <div class="ui input left icon">
                <i class="calendar icon"></i>
                <input type="text" name="[[+name]]-start" id="[[+name]]-start" value="[[!+fb[[*id]].[[+name]]-start]]" placeholder="[[+field_placeholder]]">
            </div>
        </div>
    </div>
    <div class="field [[+field_layout:is=`inherit`:then=`[[+form_layout]]`:else=`[[+field_layout]]`]] [[!If? &subject=`[[+fb[[*id]].error.[[+name]]-end]]` &operator=`notempty` &then=`error`]]">
        <label>End</label>
        <div class="ui calendar date range end">
            <div class="ui input left icon">
                <i class="calendar icon"></i>
                <input type="text" name="[[+name]]-end" id="[[+name]]-end" value="[[!+fb[[*id]].[[+name]]-end]]" placeholder="[[+field_placeholder]]">
            </div>
        </div>
    </div>

</div>

[[+field_helptext:notempty=`<div class="help">[[+field_helptext]]</div>`]]
