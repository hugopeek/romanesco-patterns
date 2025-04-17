<a class="ui avatar image" href="[[~[[+id]]]]">
    [[ImagePlus:empty=`[[$imgOverviewFallback? &mpy=`1`]]`?
        &tvname=`overview_img_square`
        &docid=`[[+id]]`
        &options=`w=150&h=150&q=[[++romanesco.img_quality]]&zc=1`
        &type=`tpl`
        &tpl=`imgOverviewFixed`
    ]]
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