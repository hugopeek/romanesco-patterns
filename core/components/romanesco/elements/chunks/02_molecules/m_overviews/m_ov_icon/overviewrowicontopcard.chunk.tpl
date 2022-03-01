<div class="content">
    <[[+title_hierarchy]] class="ui [[+title_classes]] centered icon header">
        [[If?
            &subject=`[[+icon_type]]`
            &operator=`EQ`
            &operand=`svg`
            &then=`<img class="ui faded image" src="[[+overview_icon_svg:empty=`[[++overview_icon_fallback]]`]]" alt="[[+pagetitle]]">`
            &else=`<i class="circular [[+overview_icon_font:empty=`question`]]"></i>`
        ]]
        <span class="content">
            <a href="[[~[[+id]]]]">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a>
            [[If?
                &subject=`[[+show_subtitle]]`
                &operator=`EQ`
                &operand=`1`
                &then=`<span class="sub header">[[+overview_subtitle:empty=`[[+longtitle:empty=`[[+pagetitle]]`]]`]]</span>`
            ]]
        </span>
    </[[+title_hierarchy]]>
</div>

[[If?
    &subject=`[[+show_introtext]]`
    &operator=`EQ`
    &operand=`1`
    &then=`<div class="content">[[$introtextDescription? &uid=`[[+unique_idx]]`]]</div>`
]]
[[[[If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`$buttonHrefOverview? &classes=`bottom attached` &uid=`[[+unique_idx]]``
]]]]