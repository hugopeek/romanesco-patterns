<div class="ui stackable grid">
    <figure class="five wide column">
        <a class="ui rounded image" href="[[~[[+id]]]]">
            [[ImagePlus:empty=`[[$cbOverviewRowImgFallback]]`?
                &tvname=`overview_img_landscape`
                &docid=`[[+id]]`
                &options=`w=[[++max_thumb_width:empty=`960`]]&zc=1`
                &type=`tpl`
                &tpl=`cbOverviewRowImg`
            ]]
        </a>
    </figure>

    <div class="eleven wide [[If? &subject=`[[+show_introtext]]` &operator=`EQ` &operand=`0` &then=`middle aligned`]] column">
        [[!$overviewRowBasic]]
    </div>
</div>