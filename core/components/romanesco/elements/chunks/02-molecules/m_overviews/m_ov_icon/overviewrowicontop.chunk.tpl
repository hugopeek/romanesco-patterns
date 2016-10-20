<[[+title_hierarchy]] class="ui icon header">
    [[If?
        &subject=`[[+icon_type]]`
        &operator=`EQ`
        &operand=`svg`
        &then=`<img class="ui faded image" src="[[+overview_icon_svg:empty=`[[++overview_icon_fallback]]`]]" alt="[[+pagetitle]]">`
        &else=`<i class="ui circular [[+overview_icon_svg:empty=`question`]] icon"></i>`
    ]]
    <div class="content">
        <a href="[[~[[+id]]]]">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a>
        [[If?
            &subject=`[[+show_subtitle]]`
            &operator=`EQ`
            &operand=`1`
            &then=`<div class="sub header">[[+longtitle:empty=`[[+pagetitle]]`]]</div>`
        ]]
    </div>
</[[+title_hierarchy]]>

[[If?
    &subject=`[[+show_introtext]]`
    &operator=`EQ`
    &operand=`1`
    &then=`[[!$introtextSingleParagraph]]`
]]
[[If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`<p>[[!$buttonHrefOverview]]</p>`
]]