<div class="column">
    <a class="ui rounded image" href="[[~[[+id]]]]">
        [[ImagePlus:empty=`[[$imgOverviewFallback]]`?
            &tvname=`overview_img_[[+img_type:empty=`landscape`]]`
            &docid=`[[+id]]`
            &options=`w=[[++max_thumb_width]]&q=[[++romanesco.img_quality]]&zc=1`
            &type=`tpl`
            &tpl=`imgOverview`
            &cols=`[[+img_snap:eq=`1`:then=`1`:else=`2`]]`
        ]]
    </a>
</div>
<div class="[[+content_width]] wide column">
    [[$overviewRowBasic? &uid=`[[+unique_idx]]`]]
</div>