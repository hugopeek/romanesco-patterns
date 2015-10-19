<div class="content">
    [[If?
        &subject=`[[+show_subtitle]]`
        &operator=`EQ`
        &operand=`1`
        &then=`[[!$headerHierarchySubtitle]]`
        &else=`[[!$headerHierarchy]]`
    ]]
</div>

[[If?
    &subject=`[[+show_introtext]]`
    &operator=`EQ`
    &operand=`1`
    &then=`<div class="content description">[[+introtext]]</div>`
]]

[[If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`<div class="ui bottom attached [[+de_emphasize:is=`1`:then=`small`:else=`large primary`]] button">[[+link_text]]</div>`
]]