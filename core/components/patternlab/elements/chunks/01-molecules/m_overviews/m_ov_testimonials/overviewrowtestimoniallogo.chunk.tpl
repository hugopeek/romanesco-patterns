<figure class="ui dimmable image">
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
                [[If?
                    &subject=`[[+link_text]]`
                    &operator=`isnot`
                    &operand=`0`
                    &then=`[[!$buttonHrefOverview]]`
                ]]
            </div>
        </div>
    </div>
    [[+tv.testimonial_company_image:empty=`[[$cbOverviewRowImgFallback]]`]]
</figure>