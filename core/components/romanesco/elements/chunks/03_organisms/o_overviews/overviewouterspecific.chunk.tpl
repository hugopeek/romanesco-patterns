[[setBoxType? &input=`[[+row_tpl]]` &prefix=`ov_[[+layout_id]]_[[+unique_idx]]`]]

[[If? &subject=`[[+prefix]]` &operator=`is` &operand=`ov__` &then=`<div class="ui info message">[[%romanesco.cb_preview.overview_note? &topic=`manager` &namespace=`romanescobackyard`]]</div>`]]

[[!getCache?
    &element=`getResources`
    &cacheKey=`overviews`
    [[++custom_cache:eq=`0`:then=`&cacheExpires=`1``]]

    &parents=`-1`
    &resources=`[[+resources]]`
    &limit=`[[If? &subject=`[[+prefix]]` &operator=`is` &operand=`ov__` &then=`[[+cols:textToNumber:mpy=`2`]]` &else=`[[+limit:default=`0`]]`]]`
    &tpl=`overviewRow[[+[[+prefix]].row_type]]`
    &tplWrapper=`overviewWrapper`
    &includeTVs=`1`
    &processTVs=`1`
    &tvPrefix=``
    &showHidden=`1`
    &sortby=`FIELD(modResource.id, [[+resources]])`
    &sortdir=`ASC`

    &row_tpl=`[[If? &subject=`[[$[[+row_tpl]]Theme]]` &operator=`isnull` &then=`[[+row_tpl]]` &else=`[[+row_tpl]]Theme`]]`
    &box_type=`[[+[[+prefix]].box_type]]`
    &row_type=`[[+[[+prefix]].row_type]]`
    &column_type=`[[+[[+prefix]].column_type]]`
    &grid_settings=`[[+[[+prefix]].grid_settings]]`
    &cols=`[[+cols:textToNumber]]`
    &padding=`[[+padding]]`
    &alignment=`[[+alignment]]`
    &responsive=`[[+responsive]]`
    &prefix=`[[+prefix]]`
    &unique_idx=`[[+layout_title:stripAsAlias:append=`_`]][[+layout_id]]_[[+unique_idx]]`
    &title_field=`[[+title_field]]`
    &title_hierarchy=`[[+title_hierarchy]]`
    &classes=`[[+title_hierarchy:is=`span`:then=`tiny`]]`
    &show_subtitle=`[[+show_subtitle]]`
    &show_introtext=`[[+show_introtext]]`
    &link_text=`[[If? &subject=`[[+link_text]]` &operator=`isnull` &then=`0` &else=`[[+link_text]]`]]`
    &de_emphasize=`[[+de_emphasize]]`
    &img_type=`[[+img_type]]`
    &icon_type=`[[+icon_type]]`
    &lazy_load=`[[+lazy_load]]`
]]
