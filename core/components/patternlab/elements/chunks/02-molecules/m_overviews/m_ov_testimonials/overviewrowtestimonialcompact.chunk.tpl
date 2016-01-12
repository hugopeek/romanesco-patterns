<div class="ui padded down pointing segment secondary">
    <p class="quote" property="itemReviewed" typeof="Organization">
        <span property="review">[[+longtitle]]</span>
    </p>
    <div class="ui star rating"
         data-rating="[[+tv.testimonial_rating_overall]]"
         data-max-rating="5"
         property="reviewRating"
         typeof="http://schema.org/Rating">
        <span property="ratingValue">[[+tv.testimonial_rating_overall]]</span>
    </div>
</div>

<div class="ui basic segment">
    <figure class="ui avatar image">
        [[ImagePlus:empty=`[[$cbOverviewRowImgFallback? &mpy=`1`]]`?
            &tvname=`testimonial_person_image`
            &docid=`[[+id]]`
            &options=`w=150&h=150&zc=1`
            &type=`tpl`
            &tpl=`cbOverviewRowImg`
        ]]
    </figure>
    <span class="name" property="author" typeof="http://schema.org/Person">
        <span property="name">[[+tv.testimonial_person_name]]</span>
    </span>
    <span class="meta"><em>[[+tv.testimonial_company_name]]</em></span>
</div>