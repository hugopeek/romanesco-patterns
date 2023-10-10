[[+field_name_html:empty=`[[+field_name]]`:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]
[[+field_name_html:empty=`[[+field_name]]`:fbStripAsAlias:replace=`-==`]]: {
    identifier: '[[+name]]',
    errorLimit: 1,
    rules: [
        [[+field_type:is=`email`:then=`
        {
            type   : 'email',
            prompt : '[[$fbValidationPrompt:stripForJS? &type=`email` &uid=`[[+uid]]`]]'
        },
        `]]
        [[+field_type:is=`url`:then=`
        {
            type   : 'url',
            prompt : '[[$fbValidationPrompt:stripForJS? &type=`url` &uid=`[[+uid]]`]]'
        },
        `]]
        [[+field_type:is=`number`:then=`
        {
            type   : 'number',
            prompt : '[[$fbValidationPrompt:stripForJS? &type=`number` &uid=`[[+uid]]`]]'
        },
        `]]
        [[+field_type:is=`password`:then=`
        {
            type   : 'minLength[8]',
            prompt : '[[$fbValidationPrompt:stripForJS? &type=`password` &uid=`[[+uid]]`]]'
        },
        `]]
        {
            type   : 'empty',
            prompt : '[[$fbValidationPrompt:stripForJS? &uid=`[[+uid]]`]]'
        }
    ]
},
