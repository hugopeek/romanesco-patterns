[[!$infoReviewSegment? &pointer=`down`]]

<div class="ui center aligned basic segment">
    [[!$imgOverviewPersonLink? &classes=`small circular`]]
</div>

<div class="ui small center aligned header">
    [[!$infoNamePerson]]
    [[[[If?
        &subject=`[[+show_subtitle]]`
        &operator=`EQ`
        &operand=`1`
        &then=`!$infoNameOrganization? &classes=`sub header``
    ]]]]
    [[[[If?
        &subject=`[[+show_rating]]`
        &operator=`EQ`
        &operand=`1`
        &then=`!$infoRatingStars`
    ]]]]
</div>