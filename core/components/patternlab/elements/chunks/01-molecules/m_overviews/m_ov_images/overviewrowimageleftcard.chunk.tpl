<div class="ui stackable content grid">
    <figure class="five wide column">
        <a href="[[~[[+id]]]]" class="ui rounded image">
            [[+tv.overview_image:empty=`[[$cbOverviewRowImgFallback]]`]]
        </a>
    </figure>

    <div class="eleven wide column">
        <h2><a href="[[~[[+id]]]]">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a></h2>
        <p>[[+introtext:stripString=`<p>`:stripString=`</p>`]]</p>
    </div>

    <div class="sixteen wide column">
        <a href="[[~[[+parent]]]]"><i class="bookmark icon"></i> [[#[[+parent]].menutitle]]</a>
        <a href="[[~[[+id]]]]" class="ui right floated primary button">[[+link_text]]</a>
    </div>
</div>

