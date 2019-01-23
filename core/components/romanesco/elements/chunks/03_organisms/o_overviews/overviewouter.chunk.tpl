[[setBoxType? &input=`[[+row_tpl]]` &prefix=`ov_[[+layout_id]]_[[+unique_idx]]`]]

<div class="ui [[+cols]] [[+[[+prefix]].grid_settings]] [[+padding]] nested overview [[+[[+prefix]].box_type]]">
    [[![[If? &subject=`[[+pagination]]` &operator=`EQ` &operand=`1` &then=`getPage@SemanticUI` &else=`getCache`]]?
        &element=`getResources`
        &cacheKey=`overviews`
        [[++custom_cache:eq=`0`:then=`&cacheExpires=`1``]]

        &parents=`[[+parent]]`
        &depth=`[[+depth]]`
        &limit=`[[+limit]]`
        &tpl=`overviewRow[[+[[+prefix]].row_type]]`
        &includeTVs=`1`
        &processTVs=`1`
        &tvPrefix=``
        &showHidden=`[[+show_hidden:default=`0`]]`
        &sortby=`[[+sortby]]`
        &sortdir=`[[+sortby:is=`menuindex`:then=`ASC`:else=`DESC`]]`

        &row_tpl=`[[If? &subject=`[[$[[+row_tpl]]Theme]]` &operator=`isnull` &then=`[[+row_tpl]]` &else=`[[+row_tpl]]Theme`]]`
        &cols=`[[+cols:textToNumber]]`
        &column_type=`[[+[[+prefix]].column_type]]`
        &title_field=`[[+title_field]]`
        &title_hierarchy=`[[+title_hierarchy]]`
        &classes=`[[+title_hierarchy:is=`span`:then=`tiny`]]`
        &show_subtitle=`[[+show_subtitle]]`
        &show_introtext=`[[+show_introtext]]`
        &link_text=`[[If? &subject=`[[+link_text]]` &operator=`isnull` &then=`0` &else=`[[+link_text]]`]]`
        &de_emphasize=`[[+de_emphasize]]`
        &img_type=`[[+img_type]]`
        &icon_type=`[[+icon_type]]`
    ]]
</div>

[[[[+pagination:eq=`1`:then=`$paginationFluid`]]]]