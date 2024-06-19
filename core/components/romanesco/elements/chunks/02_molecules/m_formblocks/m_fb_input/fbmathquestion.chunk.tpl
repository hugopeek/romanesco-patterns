[[!+fb[[*id]].error.fb[[*id]]-math:toPlaceholder=`math_error`]]

<div class="[[+field_layout:is=`inherit`:then=`[[+form_layout]]`:else=`[[+field_layout]]`]] field [[++formblocks.ajax_mode:eq=`1`:then=`hidden`]] [[!+math_error:notempty=`error`]] required">
    <label for="fb[[*id]]-math">
        <strong>[[!+fb[[*id]].fb[[*id]]-op1]]</strong>
        <i class="small fitted [[!+fb[[*id]].fb[[*id]]-operator:is=`-`:then=`minus`:else=`plus`]] icon"></i>
        <strong>[[!+fb[[*id]].fb[[*id]]-op2]]</strong>
        <i class="small fitted equals icon"></i>
    </label>
    <input type="hidden" name="fb[[*id]]-op1" value="[[!+fb[[*id]].fb[[*id]]-op1]]" />
    <input type="hidden" name="fb[[*id]]-op2" value="[[!+fb[[*id]].fb[[*id]]-op2]]" />
    <input type="hidden" name="fb[[*id]]-operator" value="[[!+fb[[*id]].fb[[*id]]-operator]]" />
    <input type="text" name="fb[[*id]]-math" id="fb[[*id]]-math" value="[[!+fb[[*id]].fb[[*id]]-math]]" />
    [[!+math_error:notempty=`<span class="help error">[[!+math_error]]</span>`]]
    [[+field_helptext:notempty=`<span class="help">[[+field_helptext]]</span>`]]
</div>
