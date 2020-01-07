System default==@INHERIT||
White==white||
Light==secondary||
Grey==inverted secondary||
Dark==inverted||
Primary color (Light)==primary-color||
Primary color (Dark)==inverted primary-color||
Secondary color (Light)==secondary-color||
Secondary color (Dark)==inverted secondary-color||
Transparent==transparent||

[[getResources:append=`||`?
    &parents=`[[getContextSetting:empty=`[[++romanesco.global_backgrounds_id]]`? &context=`[[*context_key]]` &setting=`romanesco.global_backgrounds_id`]]`
    &limit=`0`
    &tpl=`@INLINE [[+pagetitle]]==[[+id]]`
    &outputSeparator=`||`
    &showHidden=`1`
    &showUnpublished=`1`
    &where=`[{"template:=":"27"},{"uri:LIKE":"%/[[*context_key]]/%"}]`
    &tvFilters=`background_availability==%[[+availability]]%`
    &sortBy=`menuindex`
    &sortDir=`ASC`
]]
[[getResources?
    &parents=`[[getContextSetting:empty=`[[++romanesco.global_backgrounds_id]]`? &context=`[[*context_key]]` &setting=`romanesco.global_backgrounds_id`]]`
    &limit=`0`
    &depth=`0`
    &tpl=`@INLINE [[+pagetitle]]==[[+id]]`
    &outputSeparator=`||`
    &showHidden=`1`
    &showUnpublished=`1`
    &where=`{"template:=":"27"}`
    &sortBy=`menuindex`
    &sortDir=`ASC`
]]