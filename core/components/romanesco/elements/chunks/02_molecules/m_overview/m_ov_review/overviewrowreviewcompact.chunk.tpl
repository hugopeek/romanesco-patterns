<div class="ui padded down pointing segment secondary">
    <p class="quote" property="itemReviewed" typeof="Organization">
        <span property="review">[[+longtitle]]</span>
    </p>
    [[[[If?
        &subject=`[[+show_rating]]`
        &operator=`eq`
        &operand=`1`
        &then=`$infoRatingStars? &uid=`[[+unique_idx]]``
    ]]]]
</div>

<div class="ui basic segment">
    [[$imgOverviewPersonAvatar]]
    [[$infoNamePerson]]
    [[[[If?
        &subject=`[[+show_subtitle]]`
        &operator=`eq`
        &operand=`1`
        &then=`<span class="meta"><em>[[+organization_name]]</em></span>`
    ]]]]
</div>