<a class="ui avatar [[+icon_type:stripString=`img`]] image">
    [[$overviewRowIconBasic? &uid=`[[+unique_idx]]`]]
</a>

<div class="content">
    <a href="[[~[[+id]]]]" class="header">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a>
    [[If?
        &subject=`[[+show_subtitle]]`
        &operator=`EQ`
        &operand=`1`
        &then=`<div class="description">[[+overview_subtitle:empty=`[[+longtitle:empty=`[[+pagetitle]]`]]`]]</div>`
    ]]
</div>