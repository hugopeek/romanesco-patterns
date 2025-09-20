<article class="item">
    <div class="content">
        [[$headingOverviewLink? &title_classes=`` &classes=`` &uid=`[[+unique_idx]]_[[+idx]]`]]
        <div class="meta">
            [[+meta_elements:contains=`author`:then=`
            <span class="author">
                [[#[[+author_id]].pagetitle:empty=`[[++site_name]]`]]
            </span>
            `]]
            [[+meta_elements:contains=`date`:then=`
            <span class="date">
                [[+publishedon:strtotime:date=`[[++romanesco.date_format_medium]]`]]
            </span>
            `]]
            [[+meta_elements:contains=`reading-time`:then=`
            <span class="reading-time">
                [[+reading_time]] [[%romanesco.article.reading_time_short:lcase]]
            </span>
            `]]
        </div>
        [[If?
            &subject=`[[+show_introtext]]`
            &operator=`EQ`
            &operand=`1`
            &then=`<div class="description">[[$introtextSingleParagraph:ellipsis=`140`? &uid=`[[+unique_idx]]_[[+idx]]`]]</div>`
        ]]
    </div>
</article>