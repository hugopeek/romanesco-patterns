<div class="slider-[[+slider_type]] [[+fullscreen:eq=`1`:then=`fullscreen`]]"
     data-slick='{
         "infinite": [[+behaviour:contains=`infinite`:then=`true`:else=`false`]],
         "arrows": [[+behaviour:contains=`arrows`:then=`true`:else=`false`]],
         "dots": [[+behaviour:contains=`dots`:then=`true`:else=`false`]],
         "fade": [[+behaviour:contains=`fade`:then=`true`:else=`false`]],
         "centerMode": [[+behaviour:contains=`center`:then=`true`:else=`false`]],
         "slidesToShow": [[textToNumber? &input=`[[+slides_to_show]]`]],
         "slidesToScroll": [[+slides_to_scroll]]
     }'>
    [[+main]]
</div>


<div class="swiper-container [[+fullscreen:eq=`1`:then=`fullscreen`]]">
    [[If?
        &subject=`[[+slider_type]]`
        &operator=`is`
        &operand=`overview`
        &then=`[[+main]]`
        &else=`<div class="swiper-wrapper">[[+main]]</div>`
    ]]

    <button class="swiper-button-next"></button>
    <button class="swiper-button-prev"></button>
</div>

[[sliderLoadAssets?
    &behaviour=`[[+behaviour]]`
]]