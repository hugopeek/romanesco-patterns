[[![[If? &subject=`[[+pagination]]` &operator=`EQ` &operand=`1` &then=`getPage@SemanticUI` &else=`getCache`]]?
    &element=`getResources`
    [[++custom_cache:eq=1`:then=`&cacheKey=`overviews``]]

    &parents=`[[+parent]]`
    &resources=`[[+excluded_resources]]`
    &depth=`[[+depth]]`
    &limit=`[[+limit:default=`0`]]`
    &offset=`[[+offset:default=`0`]]`
    &tpl=`[[If? &subject=`[[$overviewRowFluidTheme]]` &operator=`isnull` &then=`overviewRowFluid` &else=`overviewRowFluidTheme`]]`
    &includeTVs=`1`
    &processTVs=`1`
    &tvPrefix=``
    &showHidden=`[[+show_hidden:default=`0`]]`
    &sortby=`[[+sortby]]`
    &sortdir=`[[+sortby:is=`menuindex`:then=`ASC`:else=`DESC`]]`

    &row_tpl=`[[If? &subject=`[[$[[+row_tpl]]Theme]]` &operator=`isnull` &then=`[[+row_tpl]]` &else=`[[+row_tpl]]Theme`]]`
    &background_even=`[[+background_even]]`
    &background_odd=`[[+background_odd]]`
    &cols=`[[+cols]]`
    &cols_interchange=`[[+cols_interchange]]`

    &title_field=`[[+title_field]]`
    &link_text=`[[+link_text]]`
    &img_snap=`[[+img_snap]]`
    &img_inflate=`[[+img_inflate]]`
]]

[[[[+pagination:eq=`1`:then=`$paginationFluid`]]]]