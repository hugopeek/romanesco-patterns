<div class="ui padded down pointing segment secondary" property="itemReviewed" typeof="Organization">
    <meta property="legalName" content="[[++site_name]]">
    <p class="quote" property="review">[[+introtext:stripString=`<p>`:stripString=`</p>`]]</p>
</div>

<div class="ui center aligned basic segment">
    <a class="ui small circular image" href="[[~[[+id]]]]">
        [[ImagePlus:empty=`[[$cbOverviewRowImgFallback? &mpy=`1`]]`?
            &tvname=`testimonial_person_image`
            &docid=`[[+id]]`
            &options=`w=800&h=800&zc=1`
            &type=`tpl`
            &tpl=`cbOverviewRowImg`
        ]]
    </a>
</div>

<div class="ui small center aligned header">
    <span property="author" typeof="http://schema.org/Person">[[+tv.testimonial_person_name]]</span>
    <div class="sub header" property="publisher" typeof="Organization">[[+tv.testimonial_company_name]]</div>
    <div class="ui star rating"
         data-rating="[[+tv.testimonial_rating_overall]]"
         data-max-rating="5"
         property="reviewRating"
         typeof="http://schema.org/Rating">
        <span property="ratingValue">[[+tv.testimonial_rating_overall]]</span>
    </div>
</div>