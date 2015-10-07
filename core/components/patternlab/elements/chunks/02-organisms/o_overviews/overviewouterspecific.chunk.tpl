[[setBoxType? &input=`[[+row_tpl]]` &prefix=`l_[[+layout_id]]_[[+layout_column]]`]]

<div class="ui [[+cols]] column doubling stackable [[+padding]] nested [[+[[+prefix]].box_type]]">
    [[!getCache?
        &element=`getResources`
        &cacheKey=`overviews`
        [[++custom_cache:eq=`0`:then=`&cacheExpires=`1``]]

        &parents=`-1`
        &resources=`[[+resources]]`
        &limit=`99`
        &tpl=`overviewRow[[+[[+prefix]].row_type]]`
        &includeTVs=`1`
        &processTVs=`1`
        &showHidden=`1`
        &sortby=`FIELD(modResource.id, [[+resources]])`
        &sortdir=`ASC`

        &row_tpl=`[[If? &subject=`[[$[[+row_tpl]]Theme]]` &operator=`isnull` &then=`[[+row_tpl]]` &else=`[[+row_tpl]]Theme`]]`
        &column_type=`[[+[[+prefix]].column_type]]`
        &title_field=`[[+title_field]]`
        &title_hierarchy=`[[+title_hierarchy]]`
        &show_introtext=`[[+show_introtext]]`
        &link_text=`[[If? &subject=`[[+link_text]]` &operator=`isnull` &then=`0` &else=`[[+link_text]]`]]`
        &de_emphasize=`[[+de_emphasize]]`
    ]]
</div>
