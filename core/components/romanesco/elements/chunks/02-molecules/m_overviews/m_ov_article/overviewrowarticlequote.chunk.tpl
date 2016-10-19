[[!setUserPlaceholders? &userId=`[[+tv.author_id]]`]]

<div class="ui padded down pointing segment secondary">
    <[[+title_hierarchy]]>
        <a href="[[~[[+id]]]]">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a>
    </[[+title_hierarchy]]>
    <p class="quote">[[+introtext:stripString=`<p>`:stripString=`</p>`]]</p>
</div>

<div class="ui basic segment">
    <a href="[[~[[+team_member_id]]]]" class="ui avatar image">
        <img src="[[ImagePlus:empty=`[[++overview_img_fallback]]`? &tvname=`person_image` &docid=`[[+team_member_id]]` &options=`w=150&h=150&zc=1` &type=`thumb`]]">
    </a>
    <span class="meta">
        <em>[[%romanesco.article.written_by]] <a href="[[~[[+team_member_id]]]]">[[+tv.author_id:userinfo=`fullname`:empty=`[[++site_name]]`]]</a> [[%romanesco.article.written_on]] [[+publishedon:strtotime:date=`%e %B %Y`]]</em>
    </span>
    [[If?
        &subject=`[[+link_text]]`
        &operator=`isnot`
        &operand=`0`
        &then=`[[!$buttonHrefOverview? &classes=`right floated`]]`
    ]]
</div>