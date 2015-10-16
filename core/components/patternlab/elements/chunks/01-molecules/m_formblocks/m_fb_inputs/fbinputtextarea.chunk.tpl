[[+field_name:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]

<div class="field [[+field_layout]] [[!If? &subject=`[[+fb[[*id]].error.[[+name]]]]` &operator=`notempty` &then=`error`]] [[If? &subject=`[[+field_required]]` &operator=`EQ` &operand=`1` &then=`required`]]">
    <label for="[[+name]]">[[+field_name:stripWords=`[[$fbStripWordsLabel]]`]]</label>
    <div class="[[+field_layout:is=`form-horizontal`:then=`five wide column`:else=`form-default`]]">
        [[!+fb[[*id]].error.[[+name]]:notempty=`<span class="label label-danger">[[!+fb[[*id]].error.[[+name]]]]</span>`]]
        <textarea rows="[[+field_rows]]" class="form-control" name="[[+name]]" id="[[+name]]" placeholder="[[+field_placeholder]]" [[+field_helptext:notempty=`aria-describedby="[[+name]]-help"`]]>[[!+fb[[*id]].[[+name]]]]</textarea>
        [[+field_helptext:notempty=`<span id="[[+name]]-help" class="help-block">[[+field_helptext]]</span>`]]
    </div>
</div>