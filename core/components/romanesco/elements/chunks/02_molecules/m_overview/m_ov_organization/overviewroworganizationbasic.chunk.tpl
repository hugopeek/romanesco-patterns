[[$imgOverviewOrganizationLink]]

[[[[If?
    &subject=`[[+show_subtitle]]`
    &operator=`eq`
    &operand=`1`
    &then=`$headingOverviewSubtitleLink? &uid=`[[+unique_idx]]``
    &else=`$headingOverviewLink? &uid=`[[+unique_idx]]``
]]]]

[[[[If?
    &subject=`[[+show_introtext]]`
    &operator=`eq`
    &operand=`1`
    &then=`$introtextDescription? &uid=`[[+unique_idx]]``
]]]]

<p>
    [[$socialConnectButtons?
        &parent_id=`[[+id]]`
        &button_type=`basic`
        &uid=`[[+unique_idx]]`
    ]]
</p>

[[If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`<p>[[$buttonHrefOverview? &uid=`[[+unique_idx]]`]]</p>`
]]