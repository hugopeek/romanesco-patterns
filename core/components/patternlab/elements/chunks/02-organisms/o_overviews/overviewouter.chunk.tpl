<div class="ui [[+cols]] column doubling stackable [[+padding]] grid">
    [[![[If? &subject=`[[+pagination]]` &operator=`EQ` &operand=`1` &then=`getPage@Bootstrap` &else=`getCache`]]?
        &element=`pdoResources`
        &cacheKey=`overviews`
        [[++custom_cache:eq=`0`:then=`&cacheExpires=`1``]]

        &parents=`[[+parent]]`
        &depth=`[[+depth]]`
        &limit=`[[+limit]]`
        &tpl=`overviewRow`
        &includeTVs=`1`
        &processTVs=`overview_image`
        &showHidden=`[[+show_hidden:default=`0`]]`
        &sortby=`[[+sortby]]`
        &sortdir=`[[+sortby:is=`menuindex`:then=`ASC`:else=`DESC`]]`

        &row_tpl=`[[+row_tpl]]`
        &wrapper=`[[+wrapper]]`
        &de_emphasize=`[[+de_emphasize]]`
        &link_text=`[[+link_text]]`
        &title_field=`[[+title_field]]`
        &title_hierarchy=`[[+title_hierarchy]]`
    ]]
</div>

[[+pagination:eq=`1`:then=`
<div class="row">
    <nav class="col-md-12 text-center">
        <ul class="pagination">
            [[!+page.nav]]
        </ul>
    </nav>
</div>
`]]
