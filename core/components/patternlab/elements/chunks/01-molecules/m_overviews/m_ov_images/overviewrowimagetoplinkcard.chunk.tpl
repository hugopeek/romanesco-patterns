[[!$imageLandscape? &classes=`rounded`]]

<div class="content">
    [[If?
        &subject=`[[+show_subtitle]]`
        &operator=`EQ`
        &operand=`1`
        &then=`[[!$headingHierarchySubtitle]]`
        &else=`[[!$headingHierarchy]]`
    ]]
    [[If?
        &subject=`[[+show_introtext]]`
        &operator=`EQ`
        &operand=`1`
        &then=`[[!$introtextDescription:stripTags=`<p><div>`]]`
    ]]
</div>