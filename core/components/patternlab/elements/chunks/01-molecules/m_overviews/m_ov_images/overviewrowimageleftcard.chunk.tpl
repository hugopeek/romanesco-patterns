<div class="ui stackable content grid">
    <figure class="five wide column">
        <a href="[[~[[+id]]]]" class="ui rounded image">
            [[+tv.overview_image:empty=`[[$cbOverviewRowImgFallback]]`]]
        </a>
    </figure>

    <div class="eleven wide column">
        [[If?
            &subject=`[[+show_subtitle]]`
            &operator=`EQ`
            &operand=`1`
            &then=`[[!$headerHierarchySubtitleLink]]`
            &else=`[[!$headerHierarchyLink]]`
        ]]
        [[If?
            &subject=`[[+show_introtext]]`
            &operator=`EQ`
            &operand=`1`
            &then=`[[!$introtextDescription]]`
        ]]
    </div>
</div>

[[If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`<div class="extra content">[[!$buttonHrefOverview? &classes=`right floated`]]</div>`
]]