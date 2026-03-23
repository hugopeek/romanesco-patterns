<script>
    window.addEventListener('DOMContentLoaded', function() {

        $('.ui.form#form-[[*alias]]').arrive('.file-upload.required input[type="file"]', function() {
            $(this).attr('data-validate','filepond');

            // Find any FilePond wrapper that contains a field with filepond validation
            $.fn.form.settings.rules.filepond = function(value, element) {
                const $wrapper = $('.filepond--root').has('input[data-validate="filepond"]');
                if ($wrapper.length === 0) {
                    return false;
                }
                const pond = window.FilePond.find($wrapper[0]);
                return pond ? pond.getFiles().length > 0 : false;
            };

            $('.ui.form#form-[[*alias]]')
                .form({
                    on: '[[*fb_frontend_validate_on:replace=`default==[[++formblocks.frontend_validate_on]]`:default=`submit`]]',
                    [[*fb_frontend_validate_on:replace=`default==[[++formblocks.frontend_validate_on]]`:is=`blur`:then=`inline: true,`]]
                    fields: {
                        [[fbFormReport:strip?
                            &formID=`[[*id]]`
                            &tplPrefix=`fbValidationRow_`
                            &requiredOnly=`1`
                        ]]
                    },
                    onSuccess: function(e) {
                        [[[[If?
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
    });
</script>