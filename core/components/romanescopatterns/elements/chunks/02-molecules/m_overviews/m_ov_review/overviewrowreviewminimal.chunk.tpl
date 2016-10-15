<figure class="ui dimmable image">
    <div class="ui dimmer">
        <div class="content">
            <div class="center">
                [[[[If?
                    &subject=`[[+show_subtitle]]`
                    &operator=`EQ`
                    &operand=`1`
                    &then=`!$headingHierarchySubtitle? &classes=`inverted``
                    &else=`!$headingHierarchy? &classes=`inverted``
                ]]]]
                [[[[If?
                    &subject=`[[+link_text]]`
                    &operator=`isnot`
                    &operand=`0`
                    &then=`!$buttonHrefOverview`
                ]]]]
            </div>
        </div>
    </div>
    [[ImagePlus:empty=`[[$cbOverviewRowImgFallback]]`?
        &tvname=`organization_logo_img`
        &docid=`[[+id]]`
        &options=`w=600&zc=1`
        &type=`tpl`
        &tpl=`cbOverviewRowImg`
    ]]
</figure>