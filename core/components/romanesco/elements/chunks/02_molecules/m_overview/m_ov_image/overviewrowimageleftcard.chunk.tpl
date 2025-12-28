<div class="ui stackable content grid">
    <figure class="five wide column">
        [[$overviewRowImageBasic? &uid=`[[+unique_idx]]`]]
    </figure>

    <div class="eleven wide column">
        [[[[If?
            &subject=`[[+show_subtitle]]`
            &operator=`EQ`
            &operand=`1`
            &then=`$headingOverviewSubtitleLink? &uid=`[[+unique_idx]]``
            &else=`$headingOverviewLink? &uid=`[[+unique_idx]]``
        ]]]]
        [[[[If?
            &subject=`[[+show_introtext]]`
            &operator=`EQ`
            &operand=`1`
            &then=`$introtextDescription? &uid=`[[+unique_idx]]``
        ]]]]
    </div>
</div>

[[If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`<div class="extra content">[[$buttonHrefOverview? &button_classes=`right floated [[+button_classes]]` &uid=`[[+unique_idx]]`]]</div>`
]]