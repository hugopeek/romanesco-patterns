--- Select a client ---==||
[[getResources?
    &parents=`[[++patternlab.client_container_id]]`
    &tpl=`@INLINE [[+pagetitle]]==[[+id]]`
    &outputSeparator=`||`
    &showHidden=`1`
    &showUnpublished=`1`
    &limit=`99`
    &sortBy=`menuindex`
    &sortDir=`ASC`
]]