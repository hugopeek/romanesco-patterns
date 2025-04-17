[[Switch:toPlaceholder=`[[+prefix]].sortdir`?
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
]]
[[[[modifiedIf?
    &subject=`[[+img_type]]`
    &operator=`is`
    &operand=`svg`
    &then=`imgOverviewSVGLink`
    &else=`imgOverviewBasicLink`
    &toPlaceholder=`[[+prefix]].img_tpl`
]]]]
[[[[modifiedIf?
    &subject=`[[+prefix]]`
    &operator=`contains`
    &operand=`__`
    &then=`$overviewSettingsPrepareMgr`
]]]]