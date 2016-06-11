[[$imgOverviewPersonLink]]

<div class="center aligned content">
    <a href="[[~[[+id]]]]" class="header">[[+person_firstname]]</a>
    [[If?
        &subject=`[[+show_subtitle]]`
        &operator=`EQ`
        &operand=`1`
        &then=`<p class="meta">[[+person_jobtitle]]</p>`
    ]]

    [[[[If?
        &subject=`[[+show_introtext]]`
        &operator=`EQ`
        &operand=`1`
        &then=`!$introtextDescription`
    ]]]]

    [[!$socialConnectButtonsPerson? &button_type=`basic`]]
</div>

[[[[If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`!$buttonHrefOverview? &classes=`bottom attached``
]]]]