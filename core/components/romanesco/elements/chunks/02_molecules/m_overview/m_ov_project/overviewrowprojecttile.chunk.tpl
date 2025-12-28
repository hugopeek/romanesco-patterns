<div class="ui dimmer">
    <div class="content">
        <div class="center">
            [[If?
                &subject=`[[+show_subtitle]]`
                &operator=`EQ`
                &operand=`1`
                &then=`[[$headingOverviewSubtitle? &classes=`inverted` &uid=`[[+unique_idx]]`]]`
                &else=`[[$headingOverview? &classes=`inverted` &uid=`[[+unique_idx]]`]]`
            ]]
            [[If?
                &subject=`[[+link_text]]`
                &operator=`isnot`
                &operand=`0`
                &then=`[[$buttonHrefOverview? &button_classes=`basic [[+button_classes]]` &uid=`[[+unique_idx]]`]]`
            ]]
        </div>
    </div>
</div>