[[getResources:prepend=`---=
`?
    &parents=`[[getContextSetting:empty=`[[++romanesco.global_backgrounds_id]]`? &context=`[[*context_key]]` &setting=`romanesco.global_backgrounds_id`]]`
    &limit=`0`
    &tpl=`@INLINE [[+pagetitle]]=[[+id]]`
    &outputSeparator=`
    `
    &showHidden=`1`
    &showUnpublished=`1`
    &where=`[{"template:=":"27"},{"uri:LIKE":"%/[[*context_key]]/%"}]`
    &tvFilters=`background_availability==%content%`
    &sortBy=`menuindex`
    &sortDir=`ASC`
]]
[[getResources:prepend=`---=
`?
    &parents=`[[getContextSetting:empty=`[[++romanesco.global_backgrounds_id]]`? &context=`[[*context_key]]` &setting=`romanesco.global_backgrounds_id`]]`
    &limit=`0`
    &depth=`0`
    &tpl=`@INLINE [[+pagetitle]]=[[+id]]`
    &outputSeparator=`
    `
    &showHidden=`1`
    &showUnpublished=`1`
    &where=`{"template:=":"27"}`
    &tvFilters=`background_availability==%content%`
    &sortBy=`menuindex`
    &sortDir=`ASC`
]]