<article class="[[+column_type]] publication">
    [[$[[+row_tpl]]? &unique_idx=`[[+unique_idx]]_[[+page:empty=`0`]]_[[+idx]]`]]
</article>
[[#[[+author_id]].pagetitle:toPlaceholder=`author_name`]]
[[structuredDataOverview?
    &type=`Article`
    &headline=`[[+longtitle:empty=`[[+pagetitle]]`]]`
    &abstract=`[[+description:empty=`[[+introtext]]`:stripTags:stripForJS]]`
    &authorId=`[[+author_id]]`
    &authorName=`[[+author_name]]`
    &datePublished=`[[+publishedon]]`
    &dateModified=`[[+editedon]]`
    &id=`[[+id]]`
    &idx=`[[+idx]]`
    &uid=`[[+unique_idx]]`
]]