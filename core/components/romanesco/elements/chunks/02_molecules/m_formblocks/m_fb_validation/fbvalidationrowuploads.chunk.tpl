[[+field_name_html:empty=`[[+field_name]]`:fbStripAsAlias:replace=`-==`]]: {
    identifier: 'filepond',
    rules: [{
        type   : 'filepond',
        prompt : '[[$fbValidationPrompt:stripForJS? &name=`fb[[*id]]-uploads` &type=`file` &uid=`[[+uid]]`]]'
    }]
},
