<div class="ui stackable content">
    <a class="five wide column" href="[[~[[+id]]]]">
        <figure class="ui rounded image">
            [[+tv.testimonial_person_image:empty=`[[$cbOverviewRowImgFallback]]`]]
        </figure>
        <div class="ui header">
            [[+tv.testimonial_person_name]]
            <div class="ui header">[[+tv.testimonial_person_company]]</div>
        </div>
    </a>

    <div class="eleven wide column">
        <h2><a href="[[~[[+id]]]]">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a></h2>
        <p>[[+introtext:stripString=`<p>`:stripString=`</p>`]]</p>
    </div>
</div>