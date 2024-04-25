[[+field_name_html:empty=`[[+field_name]]`:fbStripAsAlias:replace=`-==`]]: {
    identifier: 'fb[[*id]]-uploads',
    rules: [{
        type   : 'empty',
        prompt : '[[$fbValidationPrompt:stripForJS? &name=`fb[[*id]]-uploads` &type=`file` &uid=`[[+uid]]`]]'
    }]
},
