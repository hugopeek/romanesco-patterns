[[+field_name_html:empty=`[[+field_name]]`:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]

<div class="[[+field_layout:is=`inherit`:then=`[[+form_layout]]`:else=`[[+field_layout]]`]] field [[!If? &subject=`[[+fb[[*id]].error.[[+name]]]]` &operator=`notempty` &then=`error`]] [[If? &subject=`[[+field_required]]` &operator=`eq` &operand=`1` &then=`required`]]">
    <label for="[[+name]]">[[+field_name:stripWords=`[[$fbStripWordsLabel]]`]]</label>
    <textarea rows="[[+field_rows]]" name="[[+name]]" id="[[+name]]" placeholder="[[+field_placeholder]]">[[!+fb[[*id]].[[+name]]]]</textarea>
    [[+fb[[*id]].error.[[+name]]]]
    [[+field_helptext:notempty=`<span class="help">[[+field_helptext]]</span>`]]
</div>