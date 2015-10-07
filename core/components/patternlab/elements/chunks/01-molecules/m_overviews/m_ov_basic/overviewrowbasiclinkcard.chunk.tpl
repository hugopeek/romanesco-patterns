<div class="content">
    <[[+title_hierarchy]] class="ui [[+de_emphasize:is=`1`:then=`small`]] header">
        [[+[[+title_field]]:empty=`[[+pagetitle]]`]]
    </[[+title_hierarchy]]>
</div>

[[!If?
    &subject=`[[+show_introtext]]`
    &operator=`EQ`
    &operand=`1`
    &then=`<div class="content description">[[+introtext]]</div>`
]]

[[!If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`<div class="ui bottom attached [[+de_emphasize:is=`1`:then=`small`:else=`primary`]] button">[[+link_text]]</div>`
]]