<figure class="ui rounded image">
    [[ImagePlus:empty=`[[$cbOverviewRowImgFallback]]`?
        &tvname=`overview_img_[[+img_type:empty=`wide`]]`
        &docid=`[[+id]]`
        &options=`w=[[++max_thumb_width]]&q=[[++img_quality]]&zc=1`
        &type=`tpl`
        &tpl=`cbOverviewRowImg`
    ]]
</figure>

<div class="content">
    [[[[If?
        &subject=`[[+show_subtitle]]`
        &operator=`EQ`
        &operand=`1`
        &then=`!$headingHierarchySubtitle`
        &else=`!$headingHierarchy`
    ]]]]
    [[[[If?
        &subject=`[[+show_introtext]]`
        &operator=`EQ`
        &operand=`1`
        &then=`!$introtextDescription:stripTags=`<p><div><ul><li>``
    ]]]]
</div>