<div class="[[+alignment]] content icon">
    <[[+level]] class="ui [[+title_classes]] centered icon header">
        [[$overviewRowIconBasic? &uid=`[[+unique_idx]]`]]
        <span class="content">
            [[+[[+title_field]]:empty=`[[+pagetitle]]`]]
            [[If?
                &subject=`[[+show_subtitle]]`
                &operator=`EQ`
                &operand=`1`
                &then=`<span class="sub header">[[+overview_subtitle:empty=`[[+longtitle:empty=`[[+pagetitle]]`]]`]]</span>`
            ]]
        </span>
    </[[+level]]>
</div>

[[If?
    &subject=`[[+show_introtext]]`
    &operator=`EQ`
    &operand=`1`
    &then=`<div class="[[+alignment]] content">[[$introtextDescription:stripTags=`<p><div>`? &uid=`[[+unique_idx]]`]]</div>`
]]