<script>
    window.addEventListener('DOMContentLoaded', function() {
        $('.ui.form#form-[[*alias]]')
            .form({
                on: 'submit',
                fields: {
                    [[fbFormReport:strip?
                        &formID=`[[*id]]`
                        &tplPrefix=`fbValidationRow_`
                        &requiredOnly=`1`
                    ]]
                },
                onSuccess: function(e) {
                    [[[[modifiedIf?
                        &subject=`[[++formblocks.antispam_hooks]]`
                        &operator=`contains`
                        &operand=`recaptchav3`
                        &then=`
                            recaptchav3_render?
                                &tpl=`recaptchaOnSuccessV3`
                                &token_key=`token-[[*id]]`
                                &action_key=`fb[[*id]]`
                            `
                    ]]]]

                    [[- RECAPTCHA IS CURRENTLY INCOMPATIBLE WITH AJAX MODE
                        So if ReCaptcha is enabled, the above snippet is run
                        and the code below will not be executed.
                    ]]
                    [[[[If?
                        &subject=`[[++formblocks.ajax_mode]]`
                        &operator=`eq`
                        &operand=`1`
                        &then=`$fbSubmitAjaxJS`
                    ]]]]
                }
            })
        ;
    });
</script>