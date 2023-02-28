[[+field_name_html:empty=`[[+field_name]]`:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]
[[+field_name_html:empty=`[[+field_name]]`:fbStripAsAlias:replace=`-==`]]start: {
    identifier: '[[+name]]-start',
    rules: [{
        type   : 'empty',
        prompt : '[[$fbValidationPrompt:stripForJS? &type=`date_start` &uid=`[[+uid]]`]]'
    }]
},
[[+field_name_html:empty=`[[+field_name]]`:fbStripAsAlias:replace=`-==`]]end: {
    identifier: '[[+name]]-end',
    rules: [{
        type   : 'empty',
        prompt : '[[$fbValidationPrompt:stripForJS? &type=`date_end` &uid=`[[+uid]]`]]'
    }]
},
