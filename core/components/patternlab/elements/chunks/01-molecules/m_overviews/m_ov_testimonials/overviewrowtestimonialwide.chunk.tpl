<div class="ui mobile reversed stackable grid">
    <div class="four wide tablet six wide computer five wide large screen five wide widescreen center aligned column">
        <a class="ui circular image" href="[[~[[+id]]]]">
            [[+tv.testimonial_person_image:empty=`[[$cbOverviewRowImgFallback? &mpy=`1`]]`]]
        </a>
        <div class="ui small header">
            [[+tv.testimonial_person_name]]
            <div class="sub header">[[+tv.testimonial_company_name]]</div>
            <div class="ui star rating" data-rating="[[+tv.testimonial_rating_overall]]" data-max-rating="5"></div>
        </div>
    </div>

    <div class="twelve wide tablet ten wide computer eleven wide large screen eleven wide widescreen column">
        <div class="ui padded left pointing segment secondary">
            <p class="quote">[[+introtext:stripString=`<p>`:stripString=`</p>`]]</p>
        </div>
    </div>
</div>