[[$imgOverviewPersonLink? &classes=`circular`]]

<[[+title_hierarchy]] class="ui header">
    <a href="[[~[[+id]]]]">[[+person_firstname]]</a>
    [[If?
        &subject=`[[+show_subtitle]]`
        &operator=`EQ`
        &operand=`1`
        &then=`<p class="sub header">[[+person_jobtitle]]</p>`
    ]]
</[[+title_hierarchy]]>

[[[[If?
    &subject=`[[+show_introtext]]`
    &operator=`EQ`
    &operand=`1`
    &then=`!$introtextDescription`
]]]]

<p>
    [[!$socialConnectButtonsPerson? &button_type=`basic`]]
</p>

[[If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`<p>[[!$buttonHrefOverview]]</p>`
]]