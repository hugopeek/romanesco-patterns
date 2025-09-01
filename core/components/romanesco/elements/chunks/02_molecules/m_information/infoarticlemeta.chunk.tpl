<p class="[[+classes]] meta">
    <span class="author">
        [[$imgOverviewPersonAvatar? &id=`[[+author_id]]`]]
        [[#[[+author_id]].pagetitle:empty=`[[++site_name]]`]]
    </span>
    <span class="date">
        <i class="alternate outline calendar icon"></i>
        [[+publishedon:strtotime:date=`[[++romanesco.date_format_medium]]`]]
    </span>
    [[+reading_time:notempty=`
    <span class="reading-time">
        <i class="outline time icon"></i>
        [[+reading_time]] [[%romanesco.article.reading_time_short:lcase]]
    </span>
    `]]
    [[+comments_toggle:eq=`1`:then=`
    <span class="comments">
        <i class="outline comments icon"></i>
        <a href="[[~[[+id]]? &scheme=`full`]]#comments">[[%romanesco.article.comments:lcase]]</a>
    </span>
    `]]
</p>