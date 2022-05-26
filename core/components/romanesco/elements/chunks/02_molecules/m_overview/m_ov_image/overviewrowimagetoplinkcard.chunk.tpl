<figure class="ui rounded image">
    [[ImagePlus:empty=`[[$imgOverviewFallback]]`?
        &tvname=`overview_img_[[+img_type:empty=`wide`]]`
        &docid=`[[+id]]`
        &options=`w=[[++max_thumb_width]]&q=[[++romanesco.img_quality]]&zc=1`
        &type=`tpl`
        &tpl=`imgOverview`
    ]]
</figure>

<div class="[[+alignment]] content">
    [[[[If?
        &subject=`[[+show_subtitle]]`
        &operator=`EQ`
        &operand=`1`
        &then=`$headingOverviewSubtitle? &uid=`[[+unique_idx]]``
        &else=`$headingOverview? &uid=`[[+unique_idx]]``
    ]]]]
    [[[[If?
        &subject=`[[+show_introtext]]`
        &operator=`EQ`
        &operand=`1`
        &then=`$introtextDescription:stripTags=`<p><div><ul><li>`? &uid=`[[+unique_idx]]``
    ]]]]
</div>