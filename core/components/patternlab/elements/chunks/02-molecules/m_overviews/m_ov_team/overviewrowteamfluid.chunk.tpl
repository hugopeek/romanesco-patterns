<div class="column">
    <a class="ui circular image" href="[[~[[+id]]]]">
        [[ImagePlus:empty=`[[$cbOverviewRowImgFallback? &mpy=`1`]]`?
            &tvname=`team_member_image`
            &docid=`[[+id]]`
            &options=`w=800&h=800&zc=1`
            &type=`tpl`
            &tpl=`cbOverviewRowImg`
        ]]
    </a>
</div>

<div class="[[+cols]] wide floated column">
    <h2 class="ui header">
        <a href="[[~[[+id]]]]">[[+tv.team_member_firstname]]</a>
        <div class="sub header">[[+tv.team_member_jobtitle]]</div>
    </h2>
    <p>[[!$socialConnectButtonsTeam]]</p>
    <p>[[+introtext:stripString=`<p>`:stripString=`</p>`]]</p>
    <p>
        <a href="[[~[[+id]]]]" class="ui primary button">[[+link_text]]</a>
    </p>
</div>