[[setUserPlaceholders? &userId=`[[+author_id]]` &uid=`[[+unique_idx]]`]]

<div class="sidebar column">
    <a class="ui rounded image" href="[[~[[+id]]]]">
        [[ImagePlus:empty=`[[$imgOverviewFallback? &img_type=`landscape`]]`?
            &tvname=`overview_img_landscape`
            &docid=`[[+id]]`
            &options=``
            &type=`tpl`
            &tpl=`imgOverview`
        ]]
    </a>
</div>
<div class="[[+content_width]] wide [[+title_inflate]] main column">
    [[$headingOverviewLink? &uid=`[[+unique_idx]]`]]
    <p>
        [[[[If?
            &subject=`[[+team_member_id]]`
            &operator=`notempty`
            &then=`$imgOverviewPersonAvatarLink? &id=`[[+team_member_id]]``
        ]]]]
        <span class="meta">
            <em>
                [[%romanesco.article.written_by]]
                [[If?
                    &subject=`[[+author_id]]`
                    &operator=`notempty`
                    &then=`<a href="[[~[[+team_member_id:empty=`[[++error_page]]`]]]]">[[+author_id:userinfo=`fullname`:empty=`[[++site_name]]`]]</a>`
                    &else=`[[+createdby:userinfo=`fullname`:empty=`[[++site_name]]`]]`
                ]]
                [[%romanesco.article.written_on]]
                [[+publishedon:strtotime:date=`[[++romanesco.date_format_long]]`]]
            </em>
        </span>
    </p>
    [[[[If?
        &subject=`[[+show_introtext]]`
        &operator=`EQ`
        &operand=`1`
        &then=`$introtextDescription? &uid=`[[+unique_idx]]``
    ]]]]
    [[If?
        &subject=`[[+link_text]]`
        &operator=`isnot`
        &operand=`0`
        &then=`<p>[[$buttonHrefOverview? &uid=`[[+unique_idx]]`]]</p>`
    ]]
</div>