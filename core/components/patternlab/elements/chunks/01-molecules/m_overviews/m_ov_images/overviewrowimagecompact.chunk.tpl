<a class="ui avatar image">
    [[+tv.overview_image:empty=`[[$cbOverviewRowImgFallback? &mpy=`1`]]`]]
</a>

<div class="content">
    <a href="[[~[[+id]]]]" class="header">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a>
    [[If?
        &subject=`[[+show_subtitle]]`
        &operator=`EQ`
        &operand=`1`
        &then=`<div class="description">[[+longtitle:empty=`[[+pagetitle]]`]]</div>`
    ]]
</div>