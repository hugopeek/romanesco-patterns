[[!setUserPlaceholders? &userId=`[[+author_id]]`]]

<a href="[[~[[+team_member_id]]]]" class="ui avatar image">
    [[ImagePlus:empty=`<img src="[[++overview_icon_fallback]]" alt="[[++site_name]]">`?
        &tvname=`person_image`
        &docid=`[[+team_member_id]]`
        &options=`w=150&h=150&zc=1`
        &type=`tpl`
        &tpl=`cbOverviewRowImg`
    ]]
</a>

<div class="content">
    <a href="[[~[[+id]]]]" class="header">
        [[+[[+title_field]]:empty=`[[+pagetitle]]`]]
    </a>
    <div class="description">
        <span class="meta date">
            <i class="icon calendar"></i>
            [[+publishedon:strtotime:date=`[[++romanesco.date_format_long]]`]]
        </span>
    </div>
</div>