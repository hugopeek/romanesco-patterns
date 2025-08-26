<article class="item">
    <div class="content">
        [[$headingOverviewLink? &title_classes=`` &classes=`` &uid=`[[+unique_idx]]_[[+idx]]`]]
        <div class="meta">
            [[+meta_elements:contains=`date`:then=`
            <span class="date">
                [[+publishedon:strtotime:date=`[[++romanesco.date_format_long]]`]]
            </span>
            `]]
            [[+meta_elements:contains=`views`:then=`
            <span class="views">
                [[Rowboat?
                    &table=`modx_hits`
                    &tpl=`hitCount`
                    &limit=`1`
                    &columns=`hit_count`
                    &where=`{"hit_key":"[[+id]]"}`
                    &cacheResults=`0`
                ]] [[%romanesco.article.views:lcase]]
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