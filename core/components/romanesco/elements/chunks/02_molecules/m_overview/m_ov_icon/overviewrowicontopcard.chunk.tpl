<div class="[[+alignment]] content">
    <[[+level]] class="ui [[+title_classes]] centered icon header">
        <a class="[[+icon_classes]]" href="[[~[[+id]]]]">
            [[$overviewRowIconBasic? &uid=`[[+unique_idx]]`]]
        </a>
        <span class="content">
            <a href="[[~[[+id]]]]">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a>
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
    &then=`<div class="[[+alignment]] content">[[$introtextDescription? &uid=`[[+unique_idx]]`]]</div>`
]]
[[[[If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`$buttonHrefOverview? &classes=`bottom attached` &uid=`[[+unique_idx]]``
]]]]