<div class="ui stackable grid">
    <figure class="five wide column">
        <a href="[[~[[+id]]]]" class="ui rounded image">
            [[+tv.overview_image:empty=`[[$cbOverviewRowImgFallback]]`]]
        </a>
    </figure>

    <div class="eleven wide [[If? &subject=`[[+show_introtext]]` &operator=`EQ` &operand=`0` &then=`middle aligned`]] column">
        [[!$overviewRowBasic]]
    </div>
</div>