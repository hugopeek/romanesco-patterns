[[setUserPlaceholders? &userId=`[[+author_id]]` &uid=`[[+unique_idx]]`]]

[[$headingOverviewLink? &uid=`[[+unique_idx]]`]]

<p class="meta">
    [[$infoArticleMeta? &uid=`[[+unique_idx]]`]]
</p>

[[TaggerGetTags?
    &resources=`[[+id]]`
    &groups=`topic`
    &rowTpl=`tagItemBasicLink`
    &outTpl=`@INLINE <p class="ui labels">[[+tags]]</p>`
]]

[[[[If?
    &subject=`[[+show_introtext]]`
    &operator=`EQ`
    &operand=`1`
    &then=`$introtextSingleParagraph? &uid=`[[+unique_idx]]``
]]]]

[[[[If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`$buttonHrefOverview? &uid=`[[+unique_idx]]``
]]]]