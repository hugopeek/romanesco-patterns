[[- DEPRECATED. Slider now uses Swiper.js and this chunk doesn't seem to be used anywhere..]]
<div class="[[+display_type:empty=`slider-basic`]] [[+lightbox:eq=`1`:then=`lightbox`]]"
     data-slick='{
         "infinite": [[+behaviour:contains=`infinite`:then=`true`:else=`false`]],
         "arrows": [[+behaviour:contains=`arrows`:then=`true`:else=`false`]],
         "dots": [[+behaviour:contains=`dots`:then=`true`:else=`false`]],
         "fade": [[+behaviour:contains=`fade`:then=`true`:else=`false`]],
         "centerMode": [[+behaviour:contains=`center`:then=`true`:else=`false`]],
         "slidesToShow": [[+cols:textToNumber]],
         "slidesToScroll": [[+slides_to_scroll]]
     }'>
    [[+rows]]
</div>

[[sliderLoadAssets]]