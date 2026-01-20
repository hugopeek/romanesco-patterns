[[fbValidateProcessJSON? &formID=`[[*id]]`]]
[[cbHasField? &field=`[[++formblocks.cb_input_email_id]]` &then=`fb[[*id]]-email:email:required,`]]
[[cbHasField? &field=`[[++formblocks.cb_accept_terms_id]]` &then=`fb[[*id]]-accept-terms:required,`]]
[[cbHasField? &field=`[[++formblocks.cb_math_question_id]]` &then=`fb[[*id]]-math:required,`]]
[[[[If?
    &subject=`fbValidateCustomFields`
    &operator=`iselement`
    &operand=`chunk`
    &then=`$fbValidateCustomFields`
]]]][[++formblocks.honeypot_field:notempty=`,
fb[[*id]]-[[++formblocks.honeypot_field]]:blank`]]