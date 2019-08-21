[[!setUserPlaceholders? &userId=`[[+author_id]]`]]

<a href="[[~[[+team_member_id]]]]" class="ui avatar image">
    [[ImagePlus:empty=`[[++overview_icon_fallback]]`?
        &tvname=`person_image`
        &docid=`[[+team_member_id]]`
        &type=`thumb`
        &options=`w=150&h=150&q=[[++img_quality]]&zc=1`
    ]]
</a>

<div class="content">
    <a href="[[~[[+id]]]]" class="header">
        [[+[[+title_field]]:empty=`[[+pagetitle]]`]]
    </a>
    <div class="description">
        <span class="meta date">
            <i class="icon calendar alternate outline"></i>
            [[+publishedon:strtotime:date=`[[++romanesco.date_format_long]]`]]
        </span>
    </div>
</div>