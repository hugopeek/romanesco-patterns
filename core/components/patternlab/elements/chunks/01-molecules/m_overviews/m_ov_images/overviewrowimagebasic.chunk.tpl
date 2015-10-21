<figure class="ui rounded dimmable image">
    <div class="ui dimmer">
        <div class="content">
            <div class="center">
                [[If?
                    &subject=`[[+show_subtitle]]`
                    &operator=`EQ`
                    &operand=`1`
                    &then=`[[!$headingHierarchySubtitle? &classes=`inverted`]]`
                    &else=`[[!$headingHierarchy? &classes=`inverted`]]`
                ]]
                [[If?
                    &subject=`[[+link_text]]`
                    &operator=`isnot`
                    &operand=`0`
                    &then=`[[!$buttonHrefOverview]]`
                ]]
            </div>
        </div>
    </div>
    [[+tv.overview_img_landscape:empty=`[[$cbOverviewRowImgFallback]]`]]
</figure>