<div class="ui [[+cols]] column doubling stackable [[+padding]] [[!If? &subject=`[[+wrapper]]` &operator=`EQ` &operand=`1` &then=`nested cards` &else=`nested grid`]]">
    [[!getCache?
        &element=`getResources`
        &cacheKey=`overviews`
        [[++custom_cache:eq=`0`:then=`&cacheExpires=`1``]]

        &parents=`-1`
        &resources=`[[+resources]]`
        &limit=`99`
        &tpl=`overviewRow`
        &includeTVs=`1`
        &processTVs=`1`
        &showHidden=`1`
        &sortby=`FIELD(modResource.id, [[+resources]])`
        &sortdir=`ASC`

        &row_tpl=`[[+row_tpl]]`
        &wrapper=`[[+wrapper]]`
        &title_field=`[[+title_field]]`
        &title_hierarchy=`[[+title_hierarchy]]`
        &show_introtext=`[[+show_introtext]]`
        &link_text=`[[+link_text]]`
        &de_emphasize=`[[+de_emphasize]]`
    ]]
</div>
