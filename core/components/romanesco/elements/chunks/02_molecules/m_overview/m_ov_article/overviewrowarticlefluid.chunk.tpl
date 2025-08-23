<div class="sidebar column">
    <a class="ui rounded image" href="[[~[[+id]]]]">
        [[ImagePlus:empty=`[[$imgOverviewFallback? &img_type=`landscape` &uid=`[[+uid]]`]]`?
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
        <span class="meta">
            [[$imgOverviewPersonAvatarLink? &id=`[[+author_id]]`]]
            <em>
                [[%romanesco.article.written_by]]
                <a href="[[~[[+author_id:empty=`[[++error_page]]`]]]]">[[#[[+author_id]].pagetitle:empty=`[[++site_name]]`]]</a>
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