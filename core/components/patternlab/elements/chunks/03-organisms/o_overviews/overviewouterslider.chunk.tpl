[[![[If? &subject=`[[+pagination]]` &operator=`EQ` &operand=`1` &then=`getPage@SemanticUI` &else=`getCache`]]?
    &element=`getResources`
    &cacheKey=`overviews`
    [[++custom_cache:eq=`0`:then=`&cacheExpires=`1``]]

    &parents=`[[+parent]]`
    &depth=`[[+depth]]`
    &limit=`[[+limit]]`
    &tpl=`overviewRowFluid`
    &includeTVs=`1`
    &processTVs=`1`
    &showHidden=`[[+show_hidden:default=`0`]]`
    &sortby=`[[+sortby]]`
    &sortdir=`[[+sortby:is=`menuindex`:then=`ASC`:else=`DESC`]]`

    &row_tpl=`[[+row_tpl]]`
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