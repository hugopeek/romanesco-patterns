<figure class="ui rounded image">
    [[+tv.overview_image:empty=`[[$cbOverviewRowImgFallback]]`]]
</figure>

<div class="content">
    [[If?
        &subject=`[[+show_subtitle]]`
        &operator=`EQ`
        &operand=`1`
        &then=`[[!$headerHierarchySubtitleLink]]`
        &else=`[[!$headerHierarchyLink]]`
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
    &then=`<a href="[[~[[+id]]]]" class="[[+de_emphasize:is=`1`:then=`small`:else=`primary`]] bottom attached ui button">[[+link_text]]</a>`
]]