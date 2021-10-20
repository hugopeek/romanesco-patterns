<script>
    window.addEventListener('DOMContentLoaded', function() {
        $('.ui.form#form-[[*alias]]')
            .form({
                on: 'submit',
                fields: {
                    [[!fbFormReport:strip?
                        &formID=`[[*id]]`
                        &tplPrefix=`fbValidationRow_`
                        &requiredOnly=`1`
                    ]]
                }
            })
        ;
    });
</script>