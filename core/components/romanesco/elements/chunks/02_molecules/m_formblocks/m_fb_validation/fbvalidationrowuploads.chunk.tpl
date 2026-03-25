[[+field_name_html:empty=`[[+field_name]]`:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]
[[+field_name_html:empty=`[[+field_name]]`:fbStripAsAlias:replace=`-==`:toPlaceholder=`short_name`]]
[[+short_name]]: {
    identifier: '[[+name]]',
    rules: [{
        type   : '[[+short_name]]',
        prompt : '[[$fbValidationPrompt:stripForJS? &name=`[[+name]]` &type=`files` &uid=`[[+uid]]`]]'
    }]
},
