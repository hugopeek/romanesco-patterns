[[setBoxType? &input=`[[+row_tpl]]` &prefix=`l_[[+layout_id]]_[[+layout_column]]`]]

<div class="ui [[+cols]] column doubling stackable [[+padding]] nested [[+[[+prefix]].box_type]]">
    [[![[If? &subject=`[[+pagination]]` &operator=`EQ` &operand=`1` &then=`getPage@SemanticUI` &else=`getCache`]]?
        &element=`getResources`
        &cacheKey=`overviews`
        [[++custom_cache:eq=`0`:then=`&cacheExpires=`1``]]

        &parents=`[[If? &subject=`[[+resources]]` &operator=`notempty` &then=`-1` &else=`[[++patternlab.team_container_id]]`]]`
        &resources=`[[If? &subject=`[[+resources]]` &operator=`notempty` &then=`[[+resources]]` &else=`null`]]`
        &depth=`99`
        &limit=`[[+limit]]`
        &tpl=`overviewRowTeam[[+[[+prefix]].row_type]]`
        &includeTVs=`1`
        &processTVs=`1`
        &showHidden=`1`
        &sortby=`[[If? &subject=`[[+resources]]` &operator=`notempty` &then=`FIELD(modResource.id, [[+resources]])` &else=`[[+sortby]]`]]`
        &sortdir=`[[+sortby:is=`menuindex`:then=`ASC`:else=`DESC`]]`

        &row_tpl=`[[If? &subject=`[[$[[+row_tpl]]Theme]]` &operator=`isnull` &then=`[[+row_tpl]]` &else=`[[+row_tpl]]Theme`]]`
        &column_type=`[[+[[+prefix]].column_type]]`
        &title_field=`[[+title_field]]`
        &title_hierarchy=`[[+title_hierarchy]]`
        &show_subtitle=`[[+show_subtitle]]`
        &show_introtext=`[[+show_introtext]]`
        &link_text=`[[If? &subject=`[[+link_text]]` &operator=`isnull` &then=`0` &else=`[[+link_text]]`]]`
        &de_emphasize=`[[+de_emphasize]]`
    ]]
</div>

[[[[+pagination:eq=`1`:then=`$paginationFluid`]]]]