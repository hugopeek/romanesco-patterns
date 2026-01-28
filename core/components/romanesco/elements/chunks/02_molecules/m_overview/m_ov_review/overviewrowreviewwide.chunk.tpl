<div class="ui mobile reversed stackable grid">
    <div class="four wide tablet six wide computer five wide large screen five wide widescreen center aligned column">
        [[$imgOverviewPersonLink?
            &classes=`circular`
            &img_scale=`40`
            &uid=`[[+unique_idx]]`
        ]]
        <div class="ui small header">
            [[$infoNamePerson? &uid=`[[+unique_idx]]`]]
            [[[[If?
                &subject=`[[+show_subtitle]]`
                &operator=`eq`
                &operand=`1`
                &then=`$infoNameOrganization? &classes=`sub header` &uid=`[[+unique_idx]]``
            ]]]]
            [[[[If?
                &subject=`[[+show_rating]]`
                &operator=`eq`
                &operand=`1`
                &then=`$infoRatingStars? &uid=`[[+unique_idx]]``
            ]]]]
        </div>
    </div>

    <div class="twelve wide tablet ten wide computer eleven wide large screen eleven wide widescreen [[+alignment]] column">
        [[$infoReviewSegment? &pointer=`left` &uid=`[[+unique_idx]]`]]
    </div>
</div>