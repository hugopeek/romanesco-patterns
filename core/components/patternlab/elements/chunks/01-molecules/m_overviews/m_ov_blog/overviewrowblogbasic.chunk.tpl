[[!setUserPlaceholders? &userId=`[[+tv.article_author]]`]]

<div class="ui padded down pointing segment secondary">
    <[[+title_hierarchy]]><a href="[[~[[+id]]]]">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a></[[+title_hierarchy]]>
    <p class="quote">[[+introtext:stripString=`<p>`:stripString=`</p>`]]</p>
</div>

<div class="ui basic segment">
    <img class="ui avatar image" src="[[ImagePlus:empty=`[[++overview_img_fallback]]`? &tvname=`team_member_image` &docid=`[[+team_member_id]]` &options=`w=150&h=150&zc=1` &type=`thumb`]]">
    <span class="meta">
        <em>Geschreven door <a href="[[~[[+team_member_id]]]]">[[+tv.article_author:userinfo=`fullname`:empty=`[[++site_name]]`]]</a> op [[+publishedon:strtotime:date=`%e %B %Y`]]</em>
    </span>
    [[If?
        &subject=`[[+link_text]]`
        &operator=`isnot`
        &operand=`0`
        &then=`[[!$buttonHrefOverview? &classes=`right floated`]]`
    ]]
</div>