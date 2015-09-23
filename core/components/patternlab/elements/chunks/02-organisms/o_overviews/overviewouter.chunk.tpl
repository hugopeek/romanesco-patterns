<div class="ui [[+cols]] column doubling stackable [[+padding]] [[!If? &subject=`[[+wrapper]]` &operator=`EQ` &operand=`1` &then=`nested cards` &else=`nested grid`]]">
    [[![[If? &subject=`[[+pagination]]` &operator=`EQ` &operand=`1` &then=`getPage@Bootstrap` &else=`getCache`]]?
        &element=`getResources`
        &cacheKey=`overviews`
        [[++custom_cache:eq=`0`:then=`&cacheExpires=`1``]]

        &parents=`[[+parent]]`
        &depth=`[[+depth]]`
        &limit=`[[+limit]]`
        &tpl=`overviewRow`
        &includeTVs=`1`
        &processTVs=`1`
        &showHidden=`[[+show_hidden:default=`0`]]`
        &sortby=`[[+sortby]]`
        &sortdir=`[[+sortby:is=`menuindex`:then=`ASC`:else=`DESC`]]`

        &row_tpl=`[[+row_tpl]]`
        &wrapper=`[[+wrapper]]`
        &title_field=`[[+title_field]]`
        &title_hierarchy=`[[+title_hierarchy]]`
        &show_introtext=`[[+show_introtext]]`
        &link_text=`[[+link_text]]`
        &de_emphasize=`[[+de_emphasize]]`
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
