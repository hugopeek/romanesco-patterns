[[pdoMenu?
    &parents=`[[If? &subject=`[[+resources]]` &operator=`notempty` &then=`-1` &else=`[[+parents]]`]]`
    &resources=`[[If? &subject=`[[+resources]]` &operator=`notempty` &then=`[[+resources]]` &else=`null`]]`
    &depth=`1`
    &tplOuter=`stepsNavWrapper`
    &tpl=`[[+row_tpl:default=`stepsNavItem`]]`
    &sortby=`[[If? &subject=`[[+resources]]` &operator=`notempty` &then=`FIELD(modResource.id, [[+resources]])` &else=`menuindex`]]`
    &sortdir=`ASC`

    &select=`id,pagetitle,menutitle[[+show_subtitle:eq=`1`:then=`,longtitle`]]`
    &includeTVs=`[[+icon_type:eq=`font`:then=`overview_icon_font`]]`

    &setTotal=`1`
]]

[[stepsLoadAssets]]