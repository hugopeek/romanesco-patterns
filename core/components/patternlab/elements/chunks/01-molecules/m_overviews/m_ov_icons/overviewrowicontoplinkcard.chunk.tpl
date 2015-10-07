<figure class="icon">
    <img class="ui centered image" src="[[+tv.overview_icon_svg:empty=`[[++overview_icon_fallback]]`]]" alt="[[+pagetitle]]">
</figure>

<div class="content">
    [[If?
        &subject=`[[+show_subtitle]]`
        &operator=`EQ`
        &operand=`1`
        &then=`[[!$headerHierarchySubtitle? &classes=`centered`]]`
        &else=`[[!$headerHierarchy? &classes=`centered`]]`
    ]]
    [[If?
        &subject=`[[+show_introtext]]`
        &operator=`EQ`
        &operand=`1`
        &then=`[[!$introtextDescription]]`
    ]]
</div>