<div class="ui dimmer">
    <div class="content">
        <div class="center">
            [[If?
                &subject=`[[+show_subtitle]]`
                &operator=`EQ`
                &operand=`1`
                &then=`[[$headingHierarchySubtitle? &classes=`inverted` &uid=`[[+unique_idx]]`]]`
                &else=`[[$headingHierarchy? &classes=`inverted` &uid=`[[+unique_idx]]`]]`
            ]]
            [[If?
                &subject=`[[+link_text]]`
                &operator=`isnot`
                &operand=`0`
                &then=`[[$buttonHrefOverview? &classes=`basic inverted` &uid=`[[+unique_idx]]`]]`
            ]]
        </div>
    </div>
</div>