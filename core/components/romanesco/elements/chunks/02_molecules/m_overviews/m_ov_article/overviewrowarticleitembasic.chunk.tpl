<article class="item">
    <div class="content">
        <a class="header" href="[[~[[+id]]]]">[[+menutitle:empty=`[[+pagetitle]]`]]</a>
        <div class="meta">
            [[+meta_elements:contains=`date`:then=`
            <span class="date">
                [[+publishedon:strtotime:date=`[[++romanesco.date_format_long]]`]]
            </span>
            `]]
            [[+meta_elements:contains=`views`:then=`
            <span class="views">
                [[!Rowboat?
                    &table=`modx_hits`
                    &tpl=`hitCount`
                    &limit=`1`
                    &columns=`hit_count`
                    &where=`{"hit_key":"[[+id]]"}`
                    &cacheResults=`0`
                ]] views
            </span>
            `]]
        </div>
        [[If?
            &subject=`[[+show_introtext]]`
            &operator=`EQ`
            &operand=`1`
            &then=`<div class="description">[[$introtextSingleParagraph:ellipsis=`140`? &uid=`[[+unique_idx]]`]]</div>`
        ]]
    </div>
</article>