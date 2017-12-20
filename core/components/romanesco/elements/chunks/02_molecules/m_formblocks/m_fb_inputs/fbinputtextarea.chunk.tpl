[[+field_name:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]

<div class="field [[+form_layout:empty=`[[+field_layout]]`]] [[!If? &subject=`[[+fb[[*id]].error.[[+name]]]]` &operator=`notempty` &then=`error`]] [[If? &subject=`[[+field_required]]` &operator=`EQ` &operand=`1` &then=`required`]]">
    <label for="[[+name]]">[[+field_name:stripWords=`[[$fbStripWordsLabel]]`]]</label>
    <textarea rows="[[+field_rows]]" name="[[+name]]" id="[[+name]]" placeholder="[[+field_placeholder]]">[[!+fb[[*id]].[[+name]]]]</textarea>
    [[+field_helptext:notempty=`<p class="help">[[+field_helptext]]</p>`]]
</div>