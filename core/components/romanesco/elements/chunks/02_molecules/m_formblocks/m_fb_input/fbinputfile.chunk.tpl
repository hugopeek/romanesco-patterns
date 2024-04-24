[[+field_name_html:empty=`[[+field_name]]`:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]

<div class="[[+field_layout:is=`inherit`:then=`[[+form_layout]]`:else=`[[+field_layout]]`]] file field [[!If? &subject=`[[+fb[[*id]].error.[[+name]]]]` &operator=`notempty` &then=`error`]] [[If? &subject=`[[+field_required]]` &operator=`EQ` &operand=`1` &then=`required`]]">
    <label for="[[+name]]">[[+field_name:stripWords=`[[$fbStripWordsLabel]]`]]</label>
    <input type="file" name="[[+name]]" id="[[+name]]">
    [[+fb[[*id]].error.[[+name]]]]
    [[+field_helptext:notempty=`<span class="help">[[+field_helptext]]</span>`]]
</div>