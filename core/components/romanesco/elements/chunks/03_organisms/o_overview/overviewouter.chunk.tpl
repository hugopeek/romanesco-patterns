[[+layout_title:stripAsAlias:empty=`ov`:toPlaceholder=`ov_id`]]
[[setBoxType? &input=`[[+row_tpl]]` &prefix=`[[+ov_id]]_[[+layout_id]]_[[+unique_idx]]`]]

[[$overviewSettingsPrepare? &uid=`[[+prefix]]`]]

[[![[If? &subject=`[[+pagination]]` &operator=`eq` &operand=`1` &then=`pdoPage` &else=`getCache`]]?
    &element=`getResources`
    &cacheKey=`[[++custom_cache:eq=`1`:then=`custom/overviews/[[+user_access_level]]`:else=``]]`

    &parents=`[[+parent]]`
    &resources=`[[+excluded_resources]]`
    &depth=`[[+depth]]`
    &limit=`[[If? &subject=`[[+prefix]]` &operator=`contains` &operand=`__` &then=`[[+cols:textToNumber:mpy=`2`]]` &else=`[[+limit:default=`0`]]`]]`
    &offset=`[[+offset:default=`0`]]`
    &tpl=`overviewRow[[+[[+prefix]].row_type]]`
    &tplWrapper=`overviewWrapper[[+pagination:eq=`1`:then=`Pagination`]]`
    &includeTVs=`1`
    &processTVs=`1`
    &tvPrefix=``
    &showHidden=`[[+show_hidden:default=`0`]]`
    &sortby=`[[+sortby]]`
    &sortdir=`[[+[[+prefix]].sortdir]]`

    [[$overviewSettings? &uid=`[[+prefix]]`]]
    [[[[If?
        &subject=`[[+pagination]]`
        &operator=`eq`
        &operand=`1`
        &then=`$overviewSettingsPagination? &uid=`[[+prefix]]``
    ]]]]
]]
