[[$imgOverviewPersonLink? &uid=`[[+unique_idx]]`]]

<div class="[[+alignment]] content">
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
        &then=`$introtextDescription? &uid=`[[+unique_idx]]``
    ]]]]

    [[$socialConnectButtonsPerson? &button_type=`basic` &uid=`[[+unique_idx]]`]]
</div>

[[[[If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`$buttonHrefOverview? &classes=`bottom attached` &uid=`[[+unique_idx]]``
]]]]