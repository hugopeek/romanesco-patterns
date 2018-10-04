[[!setUserPlaceholders? &userId=`[[+author_id]]`]]

[[!$headingHierarchyLink]]

<p class="meta">
    <a href="[[~[[+team_member_id]]]]" class="ui avatar image">
        [[ImagePlus:empty=`<img src="[[++overview_icon_fallback]]" alt="[[++site_name]]">`?
            &tvname=`person_image`
            &docid=`[[+team_member_id]]`
            &options=`w=150&h=150&zc=1`
            &type=`tpl`
            &tpl=`cbOverviewRowImg`
        ]]
    </a>
    <span class="author">[[+author_id:userinfo=`fullname`:empty=`[[++site_name]]`]]</span>
    <span class="date">
        <i class="calendar icon"></i>
        [[+publishedon:strtotime:date=`[[++romanesco.date_format_long]]`]]
    </span>
    <span class="views">
        <i class="eye icon"></i>
        [[!$getHitCount:empty=`0`]]
    </span>
    [[-+comments_toggle:eq=`1`:then=`
    <span class="comments">
        <i class="icon comments"></i>
        <a href="[[~[[+id]]? &scheme=`full`]]#disqus_thread">[[%romanesco.article.comments:lcase]]</a>
    </span>
    `]]
</p>

<p class="ui tag labels">
    [[!TaggerGetTags? &resources=`[[+id]]` &rowTpl=`tagItemBasic`]]
</p>

[[[[If?
    &subject=`[[+show_introtext]]`
    &operator=`EQ`
    &operand=`1`
    &then=`!$introtextSingleParagraph`
]]]]

[[[[If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`!$buttonHrefOverview`
]]]]