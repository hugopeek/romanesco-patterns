[[!$imageLandscape? &classes=`rounded`]]

<div class="content">
    [[If?
        &subject=`[[+show_subtitle]]`
        &operator=`EQ`
        &operand=`1`
        &then=`[[!$headingHierarchySubtitleLink]]`
        &else=`[[!$headingHierarchyLink]]`
    ]]
    [[If?
        &subject=`[[+show_introtext]]`
        &operator=`EQ`
        &operand=`1`
        &then=`[[!$introtextDescription]]`
    ]]
</div>

[[If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`[[!$buttonHrefOverview? &classes=`bottom attached`]]`
]]