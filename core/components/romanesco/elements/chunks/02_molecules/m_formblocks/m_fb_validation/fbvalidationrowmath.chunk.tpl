math: {
    identifier: 'fb[[*id]]-math',
    rules: [
        {
            type   : 'empty',
            prompt : '[[$fbValidationPrompt:stripForJS? &name=`fb[[*id]]-math` &type=`math` &uid=`[[+uid]]`]]'
        },{
            type   : 'number',
            prompt : '[[$fbValidationPrompt:stripForJS? &name=`fb[[*id]]-math` &type=`number` &uid=`[[+uid]]`]]'
        }
    ]
},
