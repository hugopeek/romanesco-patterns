<div class="[[+alignment]] content icon">
    <[[+level]] class="ui [[+title_classes]] centered icon header">
        <span class="[[+icon_classes]]">
            [[$overviewRowIconBasic? &uid=`[[+unique_idx]]`]]
        </span>
        <span class="content">
            [[+[[+title_field]]:empty=`[[+pagetitle]]`]]
            [[If?
                &subject=`[[+show_subtitle]]`
                &operator=`eq`
                &operand=`1`
                &then=`<span class="sub header">[[+overview_subtitle:empty=`[[+longtitle:empty=`[[+pagetitle]]`]]`]]</span>`
            ]]
        </span>
    </[[+level]]>
</div>

[[If?
    &subject=`[[+show_introtext]]`
    &operator=`eq`
    &operand=`1`
    &then=`<div class="[[+alignment]] content">[[$introtextDescription:stripTags=`<p><div>`? &uid=`[[+unique_idx]]`]]</div>`
]]