--- Select a CTA ---=
[[getResources?
    &parents=`[[getContextSetting:empty=`[[++romanesco.cta_container_id]]`? &context=`[[*context_key]]` &setting=`romanesco.cta_container_id`]]`
    &tpl=`@INLINE [[+pagetitle]]=[[+id]]`
    &limit=`0`
    &showHidden=`0`
    &showUnpublished=`1`
    &sortBy=`menuindex`
    &sortDir=`ASC`
    &tvFilters=`cta_availability==%content%`
]]