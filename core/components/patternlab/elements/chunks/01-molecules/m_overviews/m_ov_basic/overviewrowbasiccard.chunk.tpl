<div class="content">
    [[$headerHierarchyLink]]

    [[!If?
        &subject=`[[+show_introtext]]`
        &operator=`EQ`
        &operand=`1`
        &then=`[[$introtextDescription]]`
    ]]
</div>

[[!If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`<a href="[[~[[+id]]]]" class="ui bottom attached [[+de_emphasize:is=`1`:then=`small`:else=`primary`]] button">[[+link_text]]</a>`
]]