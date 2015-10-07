<div class="ui stackable content grid">
    <a class="five wide column" href="[[~[[+id]]]]">
        <figure class="ui rounded image">
            [[+tv.overview_image:empty=`[[$cbOverviewRowImgFallback]]`]]
        </figure>
    </a>

    <div class="eleven wide column">
        <h2><a href="[[~[[+id]]]]">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a></h2>
        <p>[[+introtext:stripString=`<p>`:stripString=`</p>`]]</p>
    </div>
</div>

<div class="extra content">
    <a href="[[~[[+parent]]]]"><i class="bookmark icon"></i> [[#[[+parent]].pagetitle]]</a>
    <a href="[[~[[+id]]]]" class="ui right floated primary button">[[+link_text]]</a>
</div>