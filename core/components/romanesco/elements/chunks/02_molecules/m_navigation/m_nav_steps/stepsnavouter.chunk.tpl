[[pdoMenu?
    &parents=`[[If? &subject=`[[+resources]]` &operator=`notempty` &then=`-1` &else=`[[+parents]]`]]`
    &resources=`[[If? &subject=`[[+resources]]` &operator=`notempty` &then=`[[+resources]]` &else=`null`]]`
    &level=`1`
    &tplOuter=`stepsNavWrapper`
    &tpl=`[[+row_tpl:default=`stepsNavItem`]]`
    &sortby=`[[If? &subject=`[[+resources]]` &operator=`notempty` &then=`FIELD(modResource.id, [[+resources]])` &else=`menuindex`]]`
    &sortdir=`ASC`

    &select=`id,pagetitle,menutitle[[+show_subtitle:eq=`1`:then=`,longtitle`]]`
    &includeTVs=`[[+icon_type:inarray=`font,svg`:then=`overview_icon_[[+icon_type]]`]]`

    &setTotal=`1`
]]

[[loadAssets? &component=`steps`]]