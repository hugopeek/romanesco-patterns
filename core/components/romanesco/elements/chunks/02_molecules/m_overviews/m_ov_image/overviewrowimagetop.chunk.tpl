<figure>
    <a class="ui rounded image" href="[[~[[+id]]]]">
        [[ImagePlus:empty=`[[$cbOverviewRowImgFallback]]`?
            &tvname=`overview_img_[[+img_type:empty=`wide`]]`
            &docid=`[[+id]]`
            &options=`w=[[++max_thumb_width]]&q=[[++img_quality]]&zc=1`
            &type=`tpl`
            &tpl=`cbOverviewRowImg`
        ]]
    </a>
</figure>

[[$overviewRowBasic? &uid=`[[+unique_idx]]`]]