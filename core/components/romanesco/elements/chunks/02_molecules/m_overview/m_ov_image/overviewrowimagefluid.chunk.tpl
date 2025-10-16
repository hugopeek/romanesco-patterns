<div class="sidebar column">
    [[$overviewRowImageBasic?
        &cols=`[[+img_options:contains=`inflated`:then=`1`:else=`2`]]`
        &classes=`rounded [[+img_options:replace=`,== `]]`
        &uid=`[[+unique_idx]]`
    ]]
</div>
<div class="[[+content_width]] wide [[+title_inflate]] main column">
    [[$overviewRowBasic? &uid=`[[+unique_idx]]`]]
</div>