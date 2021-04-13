[[$imgOverviewPersonLink? &classes=`circular` &uid=`[[+unique_idx]]`]]

<[[+title_hierarchy]] class="ui header">
    <a href="[[~[[+id]]]]">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a>
    [[If?
        &subject=`[[+show_subtitle]]`
        &operator=`EQ`
        &operand=`1`
        &then=`<span class="sub header">[[+person_jobtitle:empty=`[[+longtitle]]`]]</span>`
    ]]
</[[+title_hierarchy]]>

[[[[If?
    &subject=`[[+show_introtext]]`
    &operator=`EQ`
    &operand=`1`
    &then=`$introtextDescription? &uid=`[[+unique_idx]]``
]]]]

<p>
    [[$socialConnectButtonsPerson? &button_type=`basic` &uid=`[[+unique_idx]]`]]
</p>

[[If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`<p>[[$buttonHrefOverview? &uid=`[[+unique_idx]]`]]</p>`
]]