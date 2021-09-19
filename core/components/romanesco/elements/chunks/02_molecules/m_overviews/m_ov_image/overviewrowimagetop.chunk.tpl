<figure>
    <a class="ui rounded image" href="[[~[[+id]]]]">
        [[ImagePlus:empty=`[[$imgOverviewFallback]]`?
            &tvname=`overview_img_[[+img_type:empty=`wide`]]`
            &docid=`[[+id]]`
            &options=`w=[[++max_thumb_width]]&q=[[++romanesco.img_quality]]&zc=1`
            &type=`tpl`
            &tpl=`imgOverview`
        ]]
    </a>
</figure>

[[$overviewRowBasic? &uid=`[[+unique_idx]]`]]