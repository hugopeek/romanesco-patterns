<[[+level]] class="ui [[+title_classes]] horizontal icon header">
    <a class="[[+icon_classes]]" href="[[~[[+id]]]]">
        [[$overviewRowIconBasic? &uid=`[[+unique_idx]]`]]
    </a>
    <span class="content">
        <a href="[[~[[+id]]]]">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a>
        [[If?
            &subject=`[[+show_subtitle]]`
            &operator=`eq`
            &operand=`1`
            &then=`<span class="sub header">[[+overview_subtitle:empty=`[[+longtitle:empty=`[[+pagetitle]]`]]`]]</span>`
        ]]
    </span>
</[[+level]]>

[[[[If?
    &subject=`[[+show_introtext]]`
    &operator=`eq`
    &operand=`1`
    &then=`$introtextSingleParagraph? &uid=`[[+unique_idx]]``
]]]]
[[[[If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`$buttonHrefOverview? &uid=`[[+unique_idx]]``
]]]]