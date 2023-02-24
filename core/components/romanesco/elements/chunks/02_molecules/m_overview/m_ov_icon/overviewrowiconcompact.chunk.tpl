<figure class="ui avatar [[+icon_type]] image">
    [[[[If?
        &subject=`[[+icon_type]]`
        &operator=`EQ`
        &operand=`svg`
        &then=`$iconSVG? &classes=`regular` &url=`[[+overview_icon_svg:empty=`[[++overview_icon_fallback]]`]]``
        &else=`$iconFont? &classes=`circular` &icon_class=`[[+overview_icon_font]]``
    ]]]]
</figure>

<div class="content">
    <a href="[[~[[+id]]]]" class="header">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a>
    [[If?
        &subject=`[[+show_subtitle]]`
        &operator=`EQ`
        &operand=`1`
        &then=`<div class="description">[[+overview_subtitle:empty=`[[+longtitle:empty=`[[+pagetitle]]`]]`]]</div>`
    ]]
</div>