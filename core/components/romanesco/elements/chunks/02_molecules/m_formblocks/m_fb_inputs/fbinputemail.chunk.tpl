<div class="field [[+form_layout:empty=`[[+field_layout]]`]] [[!If? &subject=`[[+fb[[*id]].error.fb[[*id]]-email]]` &operator=`notempty` &then=`error`]] required">
    <label for="fb[[*id]]-email">[[+field_name:stripWords=`[[$fbStripWordsLabel]]`]]</label>
    <input type="email" name="fb[[*id]]-email" id="fb[[*id]]-email" value="[[!+fb[[*id]].fb[[*id]]-email]]" placeholder="[[+field_placeholder]]">
    [[+fb[[*id]].error.fb[[*id]]-email]]
    [[+field_helptext:notempty=`<span class="help">[[+field_helptext]]</span>`]]
</div>