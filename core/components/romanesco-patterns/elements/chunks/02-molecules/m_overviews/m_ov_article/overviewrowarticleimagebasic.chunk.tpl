[[+tv.overview_img_pano:notempty=`
<a class="ui rounded image" href="[[~[[+id]]]]">
    [[ImagePlus:empty=`[[$cbOverviewRowImgFallback]]`?
        &tvname=`overview_img_pano`
        &docid=`[[+id]]`
        &options=`w=[[++max_thumb_width:empty=`960`]]&zc=1`
        &type=`tpl`
        &tpl=`cbOverviewRowImg`
    ]]
</a>
`]]

[[!$overviewRowArticleBasic]]