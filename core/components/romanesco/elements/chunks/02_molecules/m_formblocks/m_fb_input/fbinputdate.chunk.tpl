[[+field_name_html:empty=`[[+field_name]]`:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]

<div class="ui [[+field_layout:is=`inherit`:then=`[[+form_layout]]`:else=`[[+field_layout]]`]] calendar [[+date_type]] field [[!If? &subject=`[[+fb[[*id]].error.[[+name]]]]` &operator=`notempty` &then=`error`]] [[If? &subject=`[[+field_required]]` &operator=`EQ` &operand=`1` &then=`required`]]">
    <label for="[[+name]]">[[+field_name:stripWords=`[[$fbStripWordsLabel]]`]]</label>
    <div class="ui input left icon">
        <i class="calendar icon"></i>
        <input type="text" name="[[+name]]" id="[[+name]]" value="[[!+fb[[*id]].[[+name]]]]" placeholder="[[+field_placeholder]]">
    </div>
    [[+fb[[*id]].error.[[+name]]]]
    [[+field_helptext:notempty=`<span class="help">[[+field_helptext]]</span>`]]
</div>