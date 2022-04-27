[[setUserPlaceholders? &userId=`[[+author_id]]` &uid=`[[+unique_idx]]`]]

[[[[If?
    &subject=`[[+team_member_id]]`
    &operator=`notempty`
    &then=`$imgOverviewPersonAvatarLink? &id=`[[+team_member_id]]``
]]]]

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