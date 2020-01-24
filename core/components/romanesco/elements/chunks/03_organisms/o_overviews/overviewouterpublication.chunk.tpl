[[setBoxType? &input=`[[+row_tpl]]` &prefix=`ov_[[+layout_id]]_[[+layout_column]]`]]

[[Switch:toPlaceholder=`sortdir_[[+layout_id]]_[[+unique_idx]]`?
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

[[![[If? &subject=`[[+pagination]]` &operator=`EQ` &operand=`1` &then=`getPage@SemanticUI` &else=`getCache`]]?
    &element=`getResources`
    &cacheKey=`publication`
    [[++custom_cache:eq=`0`:then=`&cacheExpires=`1``]]

    &parents=`[[If? &subject=`[[+resources]]` &operator=`notempty` &then=`-1` &else=`[[++romanesco.publication_container_id]]`]]`
    &resources=`[[If? &subject=`[[+resources]]` &operator=`notempty` &then=`[[+resources]]` &else=`null`]]`
    &depth=`99`
    &limit=`[[+limit:default=`0`]]`
    &tpl=`overviewRowArticle[[+[[+prefix]].row_type]]`
    &tplWrapper=`overviewWrapper[[+pagination:eq=`1`:then=`Pagination`]]`
    &includeTVs=`1`
    &processTVs=`1`
    &tvPrefix=``
    &showHidden=`1`
    &sortby=`[[If? &subject=`[[+resources]]` &operator=`notempty` &then=`FIELD(modResource.id, [[+resources]])` &else=`[[+sortby]]`]]`
    &sortdir=`[[+sortdir_[[+layout_id]]_[[+unique_idx]]]]`
    &where=`[[!TaggerGetResourcesWhere]]`

    &row_tpl=`[[If? &subject=`[[$[[+row_tpl]]Theme]]` &operator=`isnull` &then=`[[+row_tpl]]` &else=`[[+row_tpl]]Theme`]]`
    &box_type=`[[+[[+prefix]].box_type]]`
    &row_type=`[[+[[+prefix]].row_type]]`
    &column_type=`[[+[[+prefix]].column_type]]`
    &grid_settings=`[[+[[+prefix]].grid_settings]]`
    &cols=`[[+cols]]`
    &padding=`[[+padding]]`
    &alignment=`[[+alignment]]`
    &responsive=`[[+responsive]]`
    &prefix=`[[+prefix]]`
    &unique_idx=`[[+unique_idx]]`
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
