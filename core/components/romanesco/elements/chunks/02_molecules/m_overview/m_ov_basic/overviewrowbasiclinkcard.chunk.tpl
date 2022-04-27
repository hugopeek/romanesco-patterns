<div class="content">
    [[[[If?
        &subject=`[[+show_subtitle]]`
        &operator=`EQ`
        &operand=`1`
        &then=`$headingOverviewSubtitle? &uid=`[[+unique_idx]]``
        &else=`$headingOverview? &uid=`[[+unique_idx]]``
    ]]]]
</div>

[[If?
    &subject=`[[+show_introtext]]`
    &operator=`EQ`
    &operand=`1`
    &then=`<div class="content description">[[+introtext]]</div>`
]]