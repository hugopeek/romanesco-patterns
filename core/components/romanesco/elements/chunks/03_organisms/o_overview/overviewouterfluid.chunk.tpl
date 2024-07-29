[[Switch:toPlaceholder=`[[+unique_idx]].sortdir`?
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

[[![[If? &subject=`[[+pagination]]` &operator=`EQ` &operand=`1` &then=`pdoPage` &else=`getCache`]]?
    &element=`getResources`
    [[++custom_cache:eq=`1`:then=`&cacheKey=`custom/overviews/[[+user_access_level`]]``]]

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
    &img_type=`[[+img_type]]`
    &img_snap=`[[+img_snap]]`
    &img_inflate=`[[+img_inflate]]`
    &lazy_load=`[[+lazy_load]]`

    [[[[+pagination:eq=`1`:then=`$overviewSettingsPagination? &uid=`[[+prefix]]``]]]]
]]

[[[[+pagination:eq=`1`:then=`$paginationFluid`]]]]