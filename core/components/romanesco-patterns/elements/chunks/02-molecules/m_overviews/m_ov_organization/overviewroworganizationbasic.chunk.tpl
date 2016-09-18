[[$imgOverviewOrganizationLink]]

[[[[If?
    &subject=`[[+show_subtitle]]`
    &operator=`EQ`
    &operand=`1`
    &then=`!$headingHierarchySubtitleLink`
    &else=`!$headingHierarchyLink`
]]]]

[[[[If?
    &subject=`[[+show_introtext]]`
    &operator=`EQ`
    &operand=`1`
    &then=`!$introtextDescription`
]]]]

<p>
    [[!$socialConnectButtonsOrganization? &button_type=`basic`]]
</p>

[[If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`<p>[[!$buttonHrefOverview]]</p>`
]]