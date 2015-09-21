<div class="ui [[+cols]] column doubling stackable [[+padding]] grid">
    [[!getCache?
        &element=`pdoResources`
        &cacheKey=`overviews`
        [[++custom_cache:eq=`0`:then=`&cacheExpires=`1``]]

        &parents=`-1`
        &resources=`[[+resources]]`
        &limit=`99`
        &tpl=`overviewRow`
        &includeTVs=`1`
        &showHidden=`1`
        &sortby=`FIELD(modResource.id, [[+resources]])`
        &sortdir=`ASC`

        &row_tpl=`[[+row_tpl]]`
        &cols_mobile=`[[+cols_mobile]]`
        &cols_desktop=`[[+cols_desktop]]`
        &wrapper=`[[+wrapper]]`
        &link_text=`[[+link_text]]`
    ]]
</div>
