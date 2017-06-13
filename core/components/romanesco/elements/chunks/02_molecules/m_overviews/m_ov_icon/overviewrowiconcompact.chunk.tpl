<div class="ui avatar image">
    [[If?
        &subject=`[[+icon_type]]`
        &operator=`EQ`
        &operand=`svg`
        &then=`<img class="ui faded image" src="[[+overview_icon_svg:empty=`[[++overview_icon_fallback]]`]]" alt="[[+pagetitle]]">`
        &else=`<i class="[[++img_corner_type]] [[+overview_icon_font:empty=`question`]]"></i>`
    ]]
</div>

<div class="content">
    <a href="[[~[[+id]]]]" class="header">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a>
    [[If?
        &subject=`[[+show_subtitle]]`
        &operator=`EQ`
        &operand=`1`
        &then=`<div class="description">[[+longtitle:empty=`[[+pagetitle]]`]]</div>`
    ]]
</div>