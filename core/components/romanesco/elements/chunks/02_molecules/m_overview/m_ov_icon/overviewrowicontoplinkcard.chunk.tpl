<div class="content">
    <[[+title_hierarchy]] class="ui [[+title_classes]] centered icon header">
        [[If?
            &subject=`[[+icon_type]]`
            &operator=`EQ`
            &operand=`svg`
            &then=`<img class="ui faded image" src="[[+overview_icon_svg:empty=`[[++overview_icon_fallback]]`]]" alt="[[+pagetitle]]">`
            &else=`<i class="circular [[+overview_icon_font:empty=`question`]]"></i>`
        ]]
        <span class="content">
            [[+[[+title_field]]:empty=`[[+pagetitle]]`]]
            [[If?
                &subject=`[[+show_subtitle]]`
                &operator=`EQ`
                &operand=`1`
                &then=`<span class="sub header">[[+overview_subtitle:empty=`[[+longtitle:empty=`[[+pagetitle]]`]]`]]</span>`
            ]]
        </span>
    </[[+title_hierarchy]]>
</div>

[[If?
    &subject=`[[+show_introtext]]`
    &operator=`EQ`
    &operand=`1`
    &then=`<div class="content">[[$introtextDescription:stripTags=`<p><div>`? &uid=`[[+unique_idx]]`]]</div>`
]]