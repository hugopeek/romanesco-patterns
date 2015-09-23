<div class="column">
    <a class="ui circular image" href="[[~[[+id]]]]">
        [[+tv.team_member_image:empty=`[[$cbOverviewRowImgFallback? &mpy=`1`]]`]]
    </a>
</div>
<div class="[[+cols]] wide floated column">
    <h2 class="ui header">
        <a href="[[~[[+id]]]]">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a>
        <div class="sub header">[[+tv.team_member_jobtitle]]</div>
    </h2>
    <p>[[+introtext:stripString=`<p>`:stripString=`</p>`]]</p>
    <p>
        <a href="[[~[[+id]]]]" class="ui primary button">[[+link_text]]</a>
        <span class="or">of</span>
        <a href="[[~[[++blog_overview_id]]? &author=`daniel`]]">lees [[+tv.team_member_firstname]]s blogartikelen</a>
    </p>
</div>