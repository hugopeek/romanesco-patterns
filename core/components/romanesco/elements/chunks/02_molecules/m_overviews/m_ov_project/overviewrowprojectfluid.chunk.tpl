<div class="sidebar column">
    <a class="ui rounded image" href="[[~[[+id]]]]">
        [[ImagePlus:empty=`[[$imgOverviewFallback]]`?
            &tvname=`overview_img_landscape`
            &docid=`[[+id]]`
            &options=``
            &type=`tpl`
            &tpl=`imgOverview`
        ]]
    </a>
</div>
<div class="[[+content_width]] wide [[+title_inflate]] main column">
    <[[+title_hierarchy]] class="ui [[+title_classes]] header">
        <a href="[[~[[+id]]]]">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a>
    </[[+title_hierarchy]]>
    [[[[If?
        &subject=`[[+show_introtext]]`
        &operator=`EQ`
        &operand=`1`
        &then=`$introtextDescription? &uid=`[[+unique_idx]]``
    ]]]]
    [[If?
        &subject=`[[+link_text]]`
        &operator=`isnot`
        &operand=`0`
        &then=`<p>[[$buttonHrefOverview? &uid=`[[+unique_idx]]`]]</p>`
    ]]
</div>