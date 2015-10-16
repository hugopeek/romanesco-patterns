[[+field_name:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]

<div class="field [[+field_layout]] [[!If? &subject=`[[+fb[[*id]].error.[[+name]]]]` &operator=`notempty` &then=`error`]] [[If? &subject=`[[+field_required]]` &operator=`EQ` &operand=`1` &then=`required`]]">
    <label for="[[+name]]">[[+field_name:stripWords=`[[$fbStripWordsLabel]]`]]</label>
    <div class="[[+field_layout:is=`form-horizontal`:then=`five wide column`:else=`form-default`]]">
        <input type="[[+field_type]]" name="[[+name]]" id="[[+name]]" value="[[!+fb[[*id]].[[+name]]]]" placeholder="[[+field_placeholder]]">
        [[+field_helptext:notempty=`<p class="help">[[+field_helptext]]</p>`]]
    </div>
</div>