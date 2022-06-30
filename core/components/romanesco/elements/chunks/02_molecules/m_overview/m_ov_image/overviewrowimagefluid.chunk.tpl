<div class="sidebar column">
    [[$overviewRowImageBasic?
        &cols=`[[+img_snap:eq=`1`:then=`1`:else=`2`]]`
        &uid=`[[+unique_idx]]`
    ]]
</div>
<div class="[[+content_width]] wide [[+title_inflate]] main column">
    [[$overviewRowBasic? &uid=`[[+unique_idx]]`]]
</div>