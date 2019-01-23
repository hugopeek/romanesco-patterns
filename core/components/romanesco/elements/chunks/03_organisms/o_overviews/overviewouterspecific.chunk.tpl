[[setBoxType? &input=`[[+row_tpl]]` &prefix=`ov_[[+layout_id]]_[[+unique_idx]]`]]

<div class="ui [[+cols]] [[+[[+prefix]].grid_settings]] [[+padding]] nested overview [[+[[+prefix]].box_type]]">
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
        &tvPrefix=``
        &showHidden=`1`
        &sortby=`FIELD(modResource.id, [[+resources]])`
        &sortdir=`ASC`

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
