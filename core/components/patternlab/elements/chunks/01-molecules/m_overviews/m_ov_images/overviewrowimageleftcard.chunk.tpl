<div class="ui stackable content grid">
    <figure class="five wide column">
        <a class="ui rounded image" href="[[~[[+id]]]]">
            [[ImagePlus:empty=`[[$cbOverviewRowImgFallback]]`?
                &tvname=`overview_img_landscape`
                &docid=`[[+id]]`
                &options=`w=[[++max_thumb_width:empty=`960`]]&zc=1`
                &type=`tpl`
                &tpl=`cbOverviewRowImg`
            ]]
        </a>
    </figure>

    <div class="eleven wide column">
        [[If?
            &subject=`[[+show_subtitle]]`
            &operator=`EQ`
            &operand=`1`
            &then=`[[!$headingHierarchySubtitleLink]]`
            &else=`[[!$headingHierarchyLink]]`
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