[[$overviewRowImageBasic? &uid=`[[+unique_idx]]`]]

<div class="[[+alignment]] content">
    [[$headingOverviewLink? &uid=`[[+unique_idx]]`]]

    [[[[If?
        &subject=`[[+show_subtitle]]`
        &operator=`EQ`
        &operand=`1`
        &then=`$infoArticleMeta? &classes=`subtitle` &uid=`[[+unique_idx]]``
    ]]]]
    [[[[If?
        &subject=`[[+show_tags]]`
        &operator=`EQ`
        &operand=`1`
        &then=`TaggerGetTags?
            &resources=`[[+id]]`
            &groups=`topic`
            &rowTpl=`tagItemBasicLink`
            &outTpl=`tagWrapper`
        `
    ]]]]
    [[[[If?
        &subject=`[[+show_introtext]]`
        &operator=`EQ`
        &operand=`1`
        &then=`$introtextDescription? &uid=`[[+unique_idx]]``
    ]]]]
</div>

[[[[If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`$buttonHrefOverview? &uid=`[[+unique_idx]]``
]]]]