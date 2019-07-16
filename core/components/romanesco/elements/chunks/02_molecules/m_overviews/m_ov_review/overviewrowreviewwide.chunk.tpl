<div class="ui mobile reversed stackable grid">
    <div class="four wide tablet six wide computer five wide large screen five wide widescreen center aligned column">
        [[!$imgOverviewPersonLink?
            &classes=`circular`
            &img_scale=`40`
        ]]
        <div class="ui small header">
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
    </div>

    <div class="twelve wide tablet ten wide computer eleven wide large screen eleven wide widescreen [[+alignment]] column">
        [[!$infoReviewSegment? &pointer=`left`]]
    </div>
</div>