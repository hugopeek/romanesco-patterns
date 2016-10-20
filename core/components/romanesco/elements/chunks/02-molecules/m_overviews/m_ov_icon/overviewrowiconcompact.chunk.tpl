<div class="ui avatar image">
    [[If?
        &subject=`[[+icon_type]]`
        &operator=`EQ`
        &operand=`svg`
        &then=`<img class="ui faded image" src="[[+overview_icon_svg:empty=`[[++overview_icon_fallback]]`]]" alt="[[+pagetitle]]">`
        &else=`<i class="ui circular [[+overview_icon_svg:empty=`question`]] icon"></i>`
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