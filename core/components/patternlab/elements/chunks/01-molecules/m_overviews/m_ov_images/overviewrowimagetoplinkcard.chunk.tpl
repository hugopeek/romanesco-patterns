<figure class="ui rounded image">
    [[+tv.overview_image:empty=`[[$cbOverviewRowImgFallback]]`]]
</figure>

<div class="content">
    [[If?
        &subject=`[[+show_subtitle]]`
        &operator=`EQ`
        &operand=`1`
        &then=`[[!$headerHierarchySubtitle]]`
        &else=`[[!$headerHierarchy]]`
    ]]
    [[If?
        &subject=`[[+show_introtext]]`
        &operator=`EQ`
        &operand=`1`
        &then=`[[!$introtextDescription]]`
    ]]
</div>