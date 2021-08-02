<div class="ui stackable content grid">
    <figure class="five wide column">
        <a class="ui rounded image" href="[[~[[+id]]]]">
            [[ImagePlus:empty=`[[$imgOverviewFallback]]`?
                &tvname=`overview_img_[[+img_type:empty=`landscape`]]`
                &docid=`[[+id]]`
                &options=`w=[[++max_thumb_width]]&q=[[++img_quality]]&zc=1`
                &type=`tpl`
                &tpl=`imgOverview`
            ]]
        </a>
    </figure>

    <div class="eleven wide column">
        [[[[If?
            &subject=`[[+show_subtitle]]`
            &operator=`EQ`
            &operand=`1`
            &then=`$headingOverviewSubtitleLink? &uid=`[[+unique_idx]]``
            &else=`$headingOverviewLink? &uid=`[[+unique_idx]]``
        ]]]]
        [[[[If?
            &subject=`[[+show_introtext]]`
            &operator=`EQ`
            &operand=`1`
            &then=`$introtextDescription? &uid=`[[+unique_idx]]``
        ]]]]
    </div>
</div>

[[If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`<div class="extra content">[[$buttonHrefOverview? &classes=`right floated` &uid=`[[+unique_idx]]`]]</div>`
]]