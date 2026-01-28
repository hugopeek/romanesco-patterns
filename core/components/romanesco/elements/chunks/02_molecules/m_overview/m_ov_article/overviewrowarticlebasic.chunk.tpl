[[$headingOverviewLink? &uid=`[[+unique_idx]]`]]

[[[[If?
    &subject=`[[+show_subtitle]]`
    &operator=`eq`
    &operand=`1`
    &then=`$infoArticleMeta? &uid=`[[+unique_idx]]``
]]]]
[[[[If?
    &subject=`[[+show_tags]]`
    &operator=`eq`
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
    &operator=`eq`
    &operand=`1`
    &then=`$introtextSingleParagraph? &uid=`[[+unique_idx]]``
]]]]

[[[[If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`$buttonHrefOverview? &uid=`[[+unique_idx]]``
]]]]