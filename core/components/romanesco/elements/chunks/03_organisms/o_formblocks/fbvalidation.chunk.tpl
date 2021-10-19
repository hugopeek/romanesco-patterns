[[!fbFormReport?
    &formID=`[[*id]]`
    &tplPrefix=`fbValidationRow`
]]
<script>
    $('#form-[[*alias]]')
        .form({
            on: 'blur',
            fields: {
                [[!fbFormReport?
                    &formID=`[[*id]]`
                    &tplPrefix=`fbValidationRow`
                ]]
            }
        })
    ;
</script>