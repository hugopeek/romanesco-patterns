<figure class="ui rounded image">
    [[ImagePlus:empty=`[[$cbOverviewRowImgFallback]]`?
        &tvname=`overview_img_landscape`
        &docid=`[[+id]]`
        &options=`w=[[++max_thumb_width:empty=`960`]]&zc=1`
        &type=`tpl`
        &tpl=`cbOverviewRowImg`
    ]]
</figure>

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