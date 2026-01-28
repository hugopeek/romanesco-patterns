<figure class="ui rounded image">
    [[$overviewRowImageBasic:stripTags=`<img>`? &uid=`[[+unique_idx]]`]]
</figure>

<div class="[[+alignment]] content">
    [[[[If?
        &subject=`[[+show_subtitle]]`
        &operator=`eq`
        &operand=`1`
        &then=`$headingOverviewSubtitle? &uid=`[[+unique_idx]]``
        &else=`$headingOverview? &uid=`[[+unique_idx]]``
    ]]]]
    [[[[If?
        &subject=`[[+show_introtext]]`
        &operator=`eq`
        &operand=`1`
        &then=`$introtextDescription:stripTags=`<p><div><ul><li>`? &uid=`[[+unique_idx]]``
    ]]]]
</div>