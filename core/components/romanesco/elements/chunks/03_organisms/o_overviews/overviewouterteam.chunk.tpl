[[setBoxType? &input=`[[+row_tpl]]` &prefix=`ov_[[+layout_id]]_[[+unique_idx]]`]]

[[$overviewSettingsPrepare? &uid=`[[+prefix]]`]]

[[![[If? &subject=`[[+pagination]]` &operator=`EQ` &operand=`1` &then=`pdoPage` &else=`getCache`]]?
    &element=`getResources`
    [[++custom_cache:eq=`1`:then=`&cacheKey=`team``]]

    &parents=`[[If? &subject=`[[+resources]]` &operator=`notempty` &then=`-1` &else=`[[++romanesco.team_container_id]]`]]`
    &resources=`[[If? &subject=`[[+resources]]` &operator=`notempty` &then=`[[+resources]]` &else=`[[+excluded_resources:empty=`null`]]`]]`
    &limit=`[[If? &subject=`[[+prefix]]` &operator=`is` &operand=`ov__` &then=`[[+cols:textToNumber:mpy=`2`]]` &else=`[[+limit:default=`0`]]`]]`
    &offset=`[[+offset:default=`0`]]`
    &tpl=`overviewRowPerson[[+[[+prefix]].row_type]]`
    &tplWrapper=`overviewWrapper[[+pagination:eq=`1`:then=`Pagination`]]`
    &includeTVs=`1`
    &processTVs=`1`
    &tvPrefix=``
    &showHidden=`1`
    &sortby=`[[If? &subject=`[[+resources]]` &operator=`notempty` &then=`FIELD(modResource.id, [[+resources]])` &else=`[[+sortby]]`]]`
    &sortdir=`[[+[[+prefix]].sortdir]]`

    [[$overviewSettings? &uid=`[[+prefix]]`]]
    [[[[+pagination:eq=`1`:then=`$overviewSettingsPagination? &uid=`[[+prefix]]``]]]]
]]
