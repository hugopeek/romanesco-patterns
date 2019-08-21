--- Select CTA ---==@INHERIT||
[[getResources?
    &parents=`[[getContextSetting:empty=`[[++romanesco.cta_container_id]]`? &context=`[[*context_key]]` &setting=`romanesco.cta_container_id`]]`
    &tpl=`@INLINE [[+pagetitle]]==[[+id]]`
    &outputSeparator=`||`
    &showHidden=`1`
    &showUnpublished=`1`
    &limit=`99`
    &sortBy=`menuindex`
    &sortDir=`ASC`
    &tvFilters=`cta_availability==%footer%`
]]