[[$infoReviewSegment? &pointer=`down` &uid=`[[+unique_idx]]`]]

<div class="ui center aligned basic segment">
    [[$imgOverviewPersonLink? &classes=`small circular` &uid=`[[+unique_idx]]`]]
</div>

<div class="ui small center aligned header">
    [[$infoNamePerson? &uid=`[[+unique_idx]]`]]
    [[[[If?
        &subject=`[[+show_subtitle]]`
        &operator=`EQ`
        &operand=`1`
        &then=`$infoNameOrganization? &classes=`sub header` &uid=`[[+unique_idx]]``
    ]]]]
    [[[[If?
        &subject=`[[+show_rating]]`
        &operator=`EQ`
        &operand=`1`
        &then=`$infoRatingStars? &uid=`[[+unique_idx]]``
    ]]]]
</div>