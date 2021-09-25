[[$overviewSettingsPrepare]]

[[!getCache?
    &element=`getResources`
    [[++custom_cache:eq=`1`:then=`&cacheKey=`overviews``]]

    &parents=`-1`
    &resources=`[[+resources]]`
    &limit=`[[If? &subject=`[[+prefix]]` &operator=`is` &operand=`ov__` &then=`[[+cols:textToNumber:mpy=`2`]]` &else=`[[+limit:default=`0`]]`]]`
    &tpl=`overviewRow[[+[[+prefix]].row_type]]`
    &tplWrapper=`overviewWrapper`
    &includeTVs=`1`
    &processTVs=`1`
    &tvPrefix=``
    &showHidden=`1`
    &sortby=`FIELD(modResource.id, [[+resources]])`
    &sortdir=`ASC`

    [[$overviewSettings]]
]]
