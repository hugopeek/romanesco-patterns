<a class="ui avatar image" href="[[~[[+id]]]]">
    [[ImagePlus:empty=`[[$cbOverviewRowImgFallback? &mpy=`1`]]`?
        &tvname=`overview_img_landscape`
        &docid=`[[+id]]`
        &options=`w=150&zc=1`
        &type=`tpl`
        &tpl=`cbOverviewRowImg`
    ]]
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