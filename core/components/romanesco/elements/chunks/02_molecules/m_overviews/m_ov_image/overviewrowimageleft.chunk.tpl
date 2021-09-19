<div class="ui stackable grid">
    <figure class="five wide column">
        <a class="ui rounded image" href="[[~[[+id]]]]">
            [[ImagePlus:empty=`[[$imgOverviewFallback]]`?
                &tvname=`overview_img_[[+img_type:empty=`landscape`]]`
                &docid=`[[+id]]`
                &options=`w=[[++max_thumb_width]]&q=[[++romanesco.img_quality]]&zc=1`
                &type=`tpl`
                &tpl=`imgOverview`
            ]]
        </a>
    </figure>

    <div class="eleven wide [[If? &subject=`[[+show_introtext]]` &operator=`EQ` &operand=`0` &then=`middle aligned`]] column">
        [[$overviewRowBasic? &uid=`[[+unique_idx]]`]]
    </div>
</div>