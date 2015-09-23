<div class="ui stackable content grid">
    <div class="five wide column">
        <a class="ui circular image" href="[[~[[+id]]]]">
            [[+tv.testimonial_person_image:empty=`[[$cbOverviewRowImgFallback? &mpy=`1`]]`]]
        </a>
        <div class="ui center aligned header">
            [[+tv.testimonial_person_name]]
            <div class="sub header">[[+tv.testimonial_company_name]]</div>
            <div class="ui star rating" data-rating="[[+tv.testimonial_rating_overall]]" data-max-rating="5"></div>
        </div>
    </div>

    <div class="eleven wide column">
        <div class="ui padded pointing segment secondary">
            <p class="quote">[[+introtext:stripString=`<p>`:stripString=`</p>`]]</p>
        </div>
    </div>
</div>