[[$overviewSettingsPrepare]]

[[![[If? &subject=`[[+pagination]]` &operator=`EQ` &operand=`1` &then=`pdoPage` &else=`getCache`]]?
    &element=`getResources`
    [[++custom_cache:eq=`1`:then=`&cacheKey=`clients``]]

    &parents=`[[If? &subject=`[[+resources]]` &operator=`notempty` &then=`-1` &else=`[[++romanesco.client_container_id]]`]]`
    &resources=`[[If? &subject=`[[+resources]]` &operator=`notempty` &then=`[[+resources]]` &else=`[[+excluded_resources:empty=`null`]]`]]`
    &limit=`[[If? &subject=`[[+prefix]]` &operator=`is` &operand=`ov__` &then=`[[+cols:textToNumber:mpy=`2`]]` &else=`[[+limit:default=`0`]]`]]`
    &offset=`[[+offset:default=`0`]]`
    &tpl=`overviewRowOrganization[[+[[+prefix]].row_type]]`
    &tplWrapper=`overviewWrapper[[+pagination:eq=`1`:then=`Pagination`]]`
    &includeTVs=`1`
    &processTVs=`1`
    &tvPrefix=``
    &showHidden=`1`
    &sortby=`[[If? &subject=`[[+resources]]` &operator=`notempty` &then=`FIELD(modResource.id, [[+resources]])` &else=`[[+sortby]]`]]`
    &sortdir=`[[+[[+prefix]].sortdir]]`

    [[$overviewSettings]]
    [[+pagination:eq=`1`:then=`[[$overviewSettingsPagination]]`]]
]]
