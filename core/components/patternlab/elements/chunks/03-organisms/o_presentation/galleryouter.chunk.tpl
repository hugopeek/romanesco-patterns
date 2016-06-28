[[+display_type:eq=`slider`:then=`
<div class="slider [[+lightbox:eq=`1`:then=`lightbox`]]"
     data-slick='{
        "slidesToShow": [[+cols:textToNumber]],
        "centerMode": [[+center_mode:eq=`1`:then=`true`:else=`false`]],
        "focusOnSelect": [[+lightbox:eq=`0`:then=`true`:else=`false`]]
    }'>
    [[+rows]]
</div>
`]]

[[+display_type:eq=`gallery`:then=`
<div class="ui [[+cols]] column doubling stackable [[+lightbox:eq=`1`:then=`lightbox`]] grid">
    [[+rows]]
</div>
`]]

[[+display_type:eq=`combo`:then=`
<div class="slider-combo ui [[+cols]] column doubling [[+lightbox:eq=`1`:then=`lightbox`]] grid">
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