--- Select CTA ---==@INHERIT||
[[getResources?
    &parents=`[[++romanesco.cta_container_id]]`
    &tpl=`@INLINE [[+pagetitle]]==[[+id]]`
    &outputSeparator=`||`
    &showHidden=`1`
    &showUnpublished=`1`
    &limit=`99`
    &sortBy=`menuindex`
    &sortDir=`ASC`
    &tvFilters=`cta_availability==%header%`
]]