<div class="content">
    [[[[If?
        &subject=`[[+show_subtitle]]`
        &operator=`EQ`
        &operand=`1`
        &then=`$headingHierarchySubtitleLink? &uid=`[[+unique_idx]]``
        &else=`$headingHierarchyLink? &uid=`[[+unique_idx]]``
    ]]]]

    [[[[If?
        &subject=`[[+show_introtext]]`
        &operator=`EQ`
        &operand=`1`
        &then=`$introtextDescription? &uid=`[[+unique_idx]]``
    ]]]]
</div>

[[[[If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`$buttonHrefOverview? &classes=`bottom attached` &uid=`[[+unique_idx]]``
]]]]