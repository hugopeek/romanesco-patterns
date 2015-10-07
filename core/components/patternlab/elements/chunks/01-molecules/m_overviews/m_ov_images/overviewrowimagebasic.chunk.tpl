<figure class="ui rounded dimmable image">
    <div class="ui dimmer">
        <div class="content">
            <div class="center">
                [[If?
                    &subject=`[[+show_subtitle]]`
                    &operator=`EQ`
                    &operand=`1`
                    &then=`[[!$headerHierarchySubtitle? &classes=`inverted`]]`
                    &else=`[[!$headerHierarchy? &classes=`inverted`]]`
                ]]
                [[!$buttonHrefOverview]]
            </div>
        </div>
    </div>
    [[+tv.overview_img_landscape:empty=`[[$cbOverviewRowImgFallback]]`]]
</figure>