[[+layout_title:stripAsAlias:empty=`ov`:toPlaceholder=`ov_id`]]
[[setBoxType? &input=`[[+row_tpl]]` &prefix=`[[+ov_id]]_[[+layout_id]]_[[+unique_idx]]`]]

[[$overviewSettingsPrepare? &uid=`[[+prefix]]`]]

[[![[If? &subject=`[[+pagination]]` &operator=`EQ` &operand=`1` &then=`pdoPage` &else=`getCache`]]?
    &element=`getResources`
    [[++custom_cache:eq=`1`:then=`&cacheKey=`testimonials``]]

    &parents=`[[If? &subject=`[[+resources]]` &operator=`notempty` &then=`-1` &else=`[[++romanesco.testimonial_container_id]]`]]`
    &resources=`[[If? &subject=`[[+resources]]` &operator=`notempty` &then=`[[+resources]]` &else=`[[+excluded_resources:empty=`null`]]`]]`
    &limit=`[[modifiedIf? &subject=`[[+prefix]]` &operator=`contains` &operand=`__` &then=`[[+cols:textToNumber:mpy=`2`]]` &else=`[[+limit:default=`0`]]`]]`
    &offset=`[[+offset:default=`0`]]`
    &tpl=`overviewRowReview[[+[[+prefix]].row_type]]`
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
