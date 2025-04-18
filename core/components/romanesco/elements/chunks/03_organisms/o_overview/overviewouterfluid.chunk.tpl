[[$overviewSettingsPrepare? &prefix=`[[+unique_idx]]`]]

[[![[If? &subject=`[[+pagination]]` &operator=`EQ` &operand=`1` &then=`pdoPage` &else=`getCache`]]?
    &element=`getResources`
    [[++custom_cache:eq=`1`:then=`&cacheKey=`custom/overviews/[[+user_access_level]]``:else=``]]

    &parents=`[[+parent]]`
    &resources=`[[+excluded_resources]]`
    &depth=`[[+depth]]`
    &limit=`[[+limit:default=`0`]]`
    &offset=`[[+offset:default=`0`]]`
    &tpl=`[[modifiedIf? &subject=`overviewRowFluidTheme` &operator=`iselement` &operand=`chunk` &then=`overviewRowFluidTheme` &else=`overviewRowFluid`]]`
    &includeTVs=`1`
    &processTVs=`1`
    &tvPrefix=``
    &showHidden=`[[+show_hidden:default=`0`]]`
    &sortby=`[[+sortby]]`
    &sortdir=`[[+[[+unique_idx]].sortdir]]`

    &row_tpl=`[[modifiedIf? &subject=`[[+row_tpl]]Theme` &operator=`iselement` &operand=`chunk` &then=`[[+row_tpl]]Theme` &else=`[[+row_tpl]]`]]`
    &background_even=`[[+background_even]]`
    &background_odd=`[[+background_odd]]`
    &content_width=`[[+content_width]]`
    &cols_interchange=`[[+cols_interchange]]`
    &padding=`[[+padding]]`

    &title_field=`[[+title_field]]`
    &level=`[[+title_hierarchy]]`
    &title_classes=`[[+title_hierarchy:is=`span`:then=`tiny`]]`
    &title_inflate=`[[+title_inflate]]`
    &show_subtitle=`[[+show_subtitle]]`
    &show_introtext=`[[+show_introtext]]`
    &link_text=`[[If? &subject=`[[+link_text]]` &operator=`isnull` &then=`0` &else=`[[+link_text]]`]]`
    &img_tpl=`[[+[[+unique_idx]].img_tpl]]`
    &img_type=`[[+img_type]]`
    &img_snap=`[[+img_snap]]`
    &img_inflate=`[[+img_inflate]]`
    &lazy_load=`[[+lazy_load]]`

    [[[[+pagination:eq=`1`:then=`$overviewSettingsPagination? &uid=`[[+prefix]]``]]]]
]]

[[[[+pagination:eq=`1`:then=`$paginationFluid`]]]]