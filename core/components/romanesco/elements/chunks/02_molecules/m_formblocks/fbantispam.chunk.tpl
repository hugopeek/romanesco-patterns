[[++formblocks.honeypot_field:notempty=`
[[++formblocks.honeypot_field:fbPrefixOutput:toPlaceholder=`honeypot_name`]]
<div class="sweetened field">
    <label for="[[+honeypot_name]]">[[%formblocks.form.honeypot_field]]</label>
    <input type="text" name="[[+honeypot_name]]" id="[[+honeypot_name]]" value="[[!+fb[[*id]].[[+honeypot_name]]]]">
</div>
`]]
[[[[If?
    &subject=`[[++romanesco.dev_mode:empty=`[[++formblocks.antispam_hooks]]`]]`
    &operator=`contains`
    &operand=`recaptchav2`
    &then=`
        !recaptchav2_render?
            &tpl=`recaptchaOnSubmitV2`
        `
]]]]
[[[[If?
    &subject=`[[++romanesco.dev_mode:empty=`[[++formblocks.antispam_hooks]]`]]`
    &operator=`contains`
    &operand=`recaptchav3`
    &then=`
        !recaptchav3_render?
            &tpl=`recaptchaOnSubmitV3`
            &token_key=`token-[[*id]]`
            &action_key=`fb[[*id]]`
        `
]]]]
[[[[If?
    &subject=`[[++romanesco.dev_mode:empty=`[[++formblocks.antispam_hooks]]`]]`
    &operator=`contains`
    &operand=`turnstile`
    &then=`$turnstileOnSubmit`
]]]]
[[!+fb[[*id]].error.recaptchav2_error:replace=`span==div`]]
[[!+fb[[*id]].error.recaptchav3_error:replace=`span==div`]]