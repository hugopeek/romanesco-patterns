<div class="ui padded down pointing segment secondary">
    <p class="quote">[[+introtext:stripString=`<p>`:stripString=`</p>`]]</p>
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
    [[+tv.testimonial_person_name]]
    <div class="sub header">[[+tv.testimonial_company_name]]</div>
    <div class="ui star rating" data-rating="[[+tv.testimonial_rating_overall]]" data-max-rating="5"></div>
</div>