<div class="content">
    <[[+title_hierarchy]] class="ui centered icon header">
        [[If?
            &subject=`[[+icon_type]]`
            &operator=`EQ`
            &operand=`svg`
            &then=`<img class="ui faded image" src="[[+tv.overview_icon_svg:empty=`[[++overview_icon_fallback]]`]]" alt="[[+pagetitle]]">`
            &else=`<i class="ui circular [[+tv.overview_icon_svg:empty=`question`]] icon"></i>`
        ]]
        <div class="content">
            [[+[[+title_field]]:empty=`[[+pagetitle]]`]]
            [[If?
                &subject=`[[+show_subtitle]]`
                &operator=`EQ`
                &operand=`1`
                &then=`<div class="sub header">[[+longtitle:empty=`[[+pagetitle]]`]]</div>`
            ]]
        </div>
    </[[+title_hierarchy]]>
</div>

[[If?
    &subject=`[[+show_introtext]]`
    &operator=`EQ`
    &operand=`1`
    &then=`<div class="content">[[!$introtextDescription:stripTags=`<p><div>`]]</div>`
]]