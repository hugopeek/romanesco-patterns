[[+display_type:eq=`slider`:then=`
<div class="[[+box_type:contains=`card`:then=`cards`]] slider-basic [[+lightbox:eq=`1`:then=`with lightbox`]] [[+caption:eq=`1`:then=`with caption`]]"
     data-slick='{
        "slidesToShow": [[+cols:textToNumber]],
        "centerMode": [[+center_mode:eq=`1`:then=`true`:else=`false`]],
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