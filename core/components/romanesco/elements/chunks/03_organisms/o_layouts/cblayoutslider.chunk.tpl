<div id="swiper-[[+unique_idx]]" class="swiper-container [[+fullscreen:eq=`1`:then=`fullscreen`]]">
    [[If?
        &subject=`[[+slider_type]]`
        &operator=`inarray`
        &operand=`overview,gallery`
        &then=`[[+main]]`
        &else=`<div class="swiper-wrapper">[[+main]]</div>`
    ]]

    [[+pagination:isnot=`false`:then=`
    <div class="swiper-pagination"></div>
    `]]

    [[+behaviour:contains=`arrows`:then=`
    <button class="swiper-button-next"></button>
    <button class="swiper-button-prev"></button>
    `]]
</div>

[[sliderLoadAssets?
    &swiperID=`swiper-[[+unique_idx]]`
    &columns=`[[textToNumber? &input=`[[+cols]]`]]`
    &slidesToScroll=`[[+slides_to_scroll]]`
    &direction=`[[+direction]]`
    &spacing=`[[+spacing]]`
    &behaviour=`[[+behaviour]]`
    &transition=`[[+transition]]`
    &lazyload=`[[+lazyload]]`
    &pagination=`[[+pagination]]`
    &responsive=`[[+responsive]]`
]]