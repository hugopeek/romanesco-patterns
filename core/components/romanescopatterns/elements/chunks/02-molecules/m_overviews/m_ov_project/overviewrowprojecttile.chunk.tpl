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
                &then=`[[!$buttonHrefOverview? &classes=`basic inverted`]]`
            ]]
        </div>
    </div>
</div>