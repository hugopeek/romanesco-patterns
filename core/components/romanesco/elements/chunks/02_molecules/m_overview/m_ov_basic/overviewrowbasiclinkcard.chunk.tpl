<div class="[[+alignment]] content">
    [[[[If?
        &subject=`[[+show_subtitle]]`
        &operator=`eq`
        &operand=`1`
        &then=`$headingOverviewSubtitle? &uid=`[[+unique_idx]]``
        &else=`$headingOverview? &uid=`[[+unique_idx]]``
    ]]]]
</div>

[[If?
    &subject=`[[+show_introtext]]`
    &operator=`eq`
    &operand=`1`
    &then=`<div class="[[+alignment]] content description">[[+introtext]]</div>`
]]