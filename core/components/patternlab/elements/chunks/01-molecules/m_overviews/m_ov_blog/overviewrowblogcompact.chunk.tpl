[[!setUserPlaceholders? &userId=`[[+tv.article_author]]`]]

<a href="[[~[[+id]]]]" class="ui avatar image">
    <img src="[[ImagePlus:empty=`[[++overview_img_fallback]]`? &tvname=`team_member_image` &docid=`[[+team_member_id]]` &options=`w=150&h=150&zc=1` &type=`thumb`]]">
</a>

<div class="content">
    <a href="[[~[[+id]]]]" class="header">
        [[+[[+title_field]]:empty=`[[+pagetitle]]`]]
        <span class="meta date">[[+createdon:strtotime:date=`%d-%m`]]</span>
    </a>
    [[If?
        &subject=`[[+show_subtitle]]`
        &operator=`EQ`
        &operand=`1`
        &then=`<div class="description">[[+longtitle:empty=`[[+pagetitle]]`]]</div>`
    ]]
</div>