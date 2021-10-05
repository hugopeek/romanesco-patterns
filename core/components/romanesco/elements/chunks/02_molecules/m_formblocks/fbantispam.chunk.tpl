[[++formblocks.honeypot_field:notempty=`
<div class="sweetened field">
    <label for="fb[[*id]]-[[++formblocks.honeypot_field]]">[[%formblocks.form.honeypot_field]]</label>
    <input type="text" name="fb[[*id]]-[[++formblocks.honeypot_field]]" value="[[!+fb[[*id]].fb[[*id]]-[[++formblocks.honeypot_field]]]]">
</div>
`]]
[[[[modifiedIf?
    &subject=`[[++formblocks.antispam_hooks]]`
    &operator=`contains`
    &operand=`recaptchav2`
    &then=`
        !recaptchav2_render?
            &tpl=`recaptchaOnSubmitV2`
        `
]]]]
[[[[modifiedIf?
    &subject=`[[++formblocks.antispam_hooks]]`
    &operator=`contains`
    &operand=`recaptchav3`
    &then=`
        !recaptchav3_render?
            &tpl=`recaptchaOnSubmitV3`
            &token_key=`token-[[*id]]`
            &action_key=`fb[[*id]]`
        `
]]]]
[[!+fb[[*id]].error.recaptchav2_error:replace=`span==div`]]
[[!+fb[[*id]].error.recaptchav3_error:replace=`span==div`]]