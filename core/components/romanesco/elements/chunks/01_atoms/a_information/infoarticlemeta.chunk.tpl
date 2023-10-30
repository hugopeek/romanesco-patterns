<p class="[[+classes]] meta">
    <span class="author">
        [[[[If?
            &subject=`[[+team_member_id]]`
            &operator=`notempty`
            &then=`$imgOverviewPersonAvatarLink? &id=`[[+team_member_id]]``
        ]]]]
        [[If?
            &subject=`[[+author_id]]`
            &operator=`notempty`
            &then=`[[+author_id:userinfo=`fullname`]]`
            &else=`<i class="user icon"></i> [[+createdby:userinfo=`fullname`:empty=`[[++site_name]]`]]`
        ]]
    </span>
    <span class="date">
        <i class="calendar icon"></i>
        [[+publishedon:strtotime:date=`[[++romanesco.date_format_long]]`]]
    </span>
    <span class="views">
        <i class="eye icon"></i>
        [[$getHitCount:empty=`0`? &uid=`[[+unique_idx]]`]]
    </span>
    [[+comments_toggle:eq=`1`:then=`
    <span class="comments">
        <i class="icon comments"></i>
        <a href="[[~[[+id]]? &scheme=`full`]]#comments">[[%romanesco.article.comments:lcase]]</a>
    </span>
    `]]
</p>