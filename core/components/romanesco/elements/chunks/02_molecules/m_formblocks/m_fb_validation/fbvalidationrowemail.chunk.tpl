[[+field_name:fbStripAsAlias:replace=`-==`]]: {
    identifier: 'fb[[*id]]-email',
    rules: [{
        type   : 'email',
        prompt : '[[!$fbValidationPrompt:stripForJS? &name=`fb[[*id]]-email` &type=`email`]]'
    }]
},
