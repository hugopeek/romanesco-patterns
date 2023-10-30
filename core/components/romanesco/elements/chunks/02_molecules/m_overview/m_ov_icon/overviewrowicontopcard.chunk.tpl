<div class="[[+alignment]] content">
    <[[+level]] class="ui [[+title_classes]] centered icon header">
        [[[[If?
            &subject=`[[+icon_type]]`
            &operator=`EQ`
            &operand=`svg`
            &then=`$iconSVG? &classes=`ui svg image` &url=`[[+overview_icon_svg:empty=`[[++overview_icon_fallback]]`]]``
            &else=`$iconFont? &classes=`circular` &icon_class=`[[+overview_icon_font]]``
        ]]]]
        <span class="content">
            <a href="[[~[[+id]]]]">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a>
            [[If?
                &subject=`[[+show_subtitle]]`
                &operator=`EQ`
                &operand=`1`
                &then=`<span class="sub header">[[+overview_subtitle:empty=`[[+longtitle:empty=`[[+pagetitle]]`]]`]]</span>`
            ]]
        </span>
    </[[+level]]>
</div>

[[If?
    &subject=`[[+show_introtext]]`
    &operator=`EQ`
    &operand=`1`
    &then=`<div class="[[+alignment]] content">[[$introtextDescription? &uid=`[[+unique_idx]]`]]</div>`
]]
[[[[If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`$buttonHrefOverview? &classes=`bottom attached` &uid=`[[+unique_idx]]``
]]]]