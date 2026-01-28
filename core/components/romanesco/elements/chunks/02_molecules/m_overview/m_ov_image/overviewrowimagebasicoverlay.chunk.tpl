<figure class="ui rounded dimmable image">
    <div class="ui dimmer">
        <div class="content">
            <div class="center">
                [[[[If?
                    &subject=`[[+show_subtitle]]`
                    &operator=`eq`
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
    [[$overviewRowImageBasic:stripTags=`<img>`? &uid=`[[+unique_idx]]`]]
</figure>

[[loadAssets? &component=`dimmer`]]