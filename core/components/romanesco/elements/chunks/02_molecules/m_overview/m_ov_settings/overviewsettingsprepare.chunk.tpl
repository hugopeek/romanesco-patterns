[[Switch?
    &get=`[[+sortby]]_[[+sortdir]]`
    &c1=`menuindex_0`     &do1=`ASC`
    &c2=`publishedon_0`   &do2=`DESC`
    &c3=`createdon_0`     &do3=`DESC`
    &c4=`pagetitle_0`     &do4=`ASC`

    &c5=`menuindex_1`     &do5=`DESC`
    &c6=`publishedon_1`   &do6=`ASC`
    &c7=`createdon_1`     &do7=`ASC`
    &c8=`pagetitle_1`     &do8=`DESC`

    &default=`DESC`
    &toPlaceholder=`[[+prefix]].sortdir`
]]
[[[[If?
    &subject=`[[+img_type]]`
    &operator=`is`
    &operand=`svg`
    &then=`imgOverviewSVGLink`
    &else=`imgOverviewBasicLink`
    &toPlaceholder=`[[+prefix]].img_tpl`
]]]]
[[Switch?
    &get=`[[+icon_type]]`
    &c1=`svg`   &do1=`ui [[+de_emphasize:is=`1`:then=`muted`]] svg image`
    &c2=`font`  &do2=`ui [[+de_emphasize:is=`1`:then=`muted`]] icon image`
    &c3=`img`   &do3=`ui [[+de_emphasize:is=`1`:then=`muted`]] image`
    &toPlaceholder=`[[+prefix]].icon_classes`
]]
[[Switch?
    &get=`[[+de_emphasize]]`
    &c1=`1` &do1=`small`
    &default=`large primary`
    &toPlaceholder=`[[+prefix]].button_classes`
]]
[[[[If?
    &subject=`[[+prefix]]`
    &operator=`contains`
    &operand=`__`
    &then=`$overviewSettingsPrepareMgr`
]]]]