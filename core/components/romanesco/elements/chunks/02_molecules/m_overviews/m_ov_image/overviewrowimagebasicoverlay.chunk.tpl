<figure class="ui rounded dimmable image">
    <div class="ui dimmer">
        <div class="content">
            <div class="center">
                [[[[If?
                    &subject=`[[+show_subtitle]]`
                    &operator=`EQ`
                    &operand=`1`
                    &then=`$headingOverviewSubtitle? &classes=`inverted` &uid=`[[+unique_idx]]``
                    &else=`$headingOverview? &classes=`inverted` &uid=`[[+unique_idx]]``
                ]]]]
                [[[[If?
                    &subject=`[[+link_text]]`
                    &operator=`isnot`
                    &operand=`0`
                    &then=`$buttonHrefOverview? &uid=`[[+unique_idx]]``
                ]]]]
            </div>
        </div>
    </div>
    [[ImagePlus:empty=`[[$imgOverviewFallback]]`?
        &tvname=`overview_img_[[+img_type:empty=`landscape`]]`
        &docid=`[[+id]]`
        &options=`w=[[++max_thumb_width]]&q=[[++romanesco.img_quality]]&zc=1`
        &type=`tpl`
        &tpl=`imgOverview`
    ]]
</figure>