[[+display_type:eq=`slider`:then=`
<div class="[[+box_type:contains=`card`:then=`cards`]] slider-basic [[+lightbox:eq=`1`:then=`with lightbox`]] [[+caption:eq=`1`:then=`with caption`]]"
     data-slick='{
         "infinite": [[+behaviour:contains=`infinite`:then=`true`:else=`false`]],
         "arrows": [[+behaviour:contains=`arrows`:then=`true`:else=`false`]],
         "dots": [[+behaviour:contains=`dots`:then=`true`:else=`false`]],
         "fade": [[+behaviour:contains=`fade`:then=`true`:else=`false`]],
         "centerMode": [[+behaviour:contains=`center`:then=`true`:else=`false`]],
         "slidesToShow": [[+cols:textToNumber]],
         "slidesToScroll": [[+slides_to_scroll]],
         "focusOnSelect": [[+lightbox:eq=`0`:then=`true`:else=`false`]]
     }'>
    [[+rows]]
</div>
`]]

[[+display_type:eq=`gallery`:then=`
<div class="ui [[+cols]] column doubling stackable [[+padding]] grid gallery [[+lightbox:eq=`1`:then=`with lightbox`]] [[+caption:eq=`1`:then=`with caption`]]">
    [[+rows]]
</div>
`]]

[[+display_type:eq=`combo`:then=`
<div class="ui [[+cols]] column doubling [[+padding]] grid slider-combo [[+lightbox:eq=`1`:then=`with lightbox`]] [[+caption:eq=`1`:then=`with caption`]]">
    [[+rows]]
</div>
`]]

[[+display_type:eq=`synced`:then=`
<div class="slider-synced">
    [[+rows]]
</div>

<div class="slider-synced-nav"
     data-slick='{
        "slidesToShow": [[+cols:textToNumber]],
        "centerMode": [[+center_mode:eq=`1`:then=`true`:else=`false`]]
    }'>
    [[+rows]]
</div>
`]]

[[sliderLoadAssets]]