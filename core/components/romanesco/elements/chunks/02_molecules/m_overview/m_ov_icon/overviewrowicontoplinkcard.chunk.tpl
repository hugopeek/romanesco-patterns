<div class="[[+alignment]] content">
    <[[+title_hierarchy]] class="ui [[+title_classes]] centered icon header">
        [[[[If?
            &subject=`[[+icon_type]]`
            &operator=`EQ`
            &operand=`svg`
            &then=`$iconSVG? &classes=`ui svg image` &url=`[[+overview_icon_svg:empty=`[[++overview_icon_fallback]]`]]``
            &else=`$iconFont? &classes=`circular` &icon_class=`[[+overview_icon_font]]``
        ]]]]
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
    &then=`<div class="[[+alignment]] content">[[$introtextDescription:stripTags=`<p><div>`? &uid=`[[+unique_idx]]`]]</div>`
]]