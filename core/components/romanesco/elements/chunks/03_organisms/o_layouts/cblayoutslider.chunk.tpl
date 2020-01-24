<div id="swiper-[[+unique_idx]]" class="swiper-container[[+mobile_only:eq=`1`:then=`-mobile`]] [[+fullscreen:eq=`1`:then=`fullscreen`]]">
    [[If?
        &subject=`[[+slider_type]]`
        &operator=`inarray`
        &operand=`overview,gallery`
        &then=`[[+main]]`
        &else=`<div class="swiper-wrapper[[+mobile_only:eq=`1`:then=`-mobile`]]">[[+main]]</div>`
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
    &uid=`[[+unique_idx]]`
    &columns=`[[textToNumber? &input=`[[+cols]]`]]`
    &slidesToScroll=`[[+slides_to_scroll]]`
    &direction=`[[+direction]]`
    &spacing=`[[+spacing]]`
    &behaviour=`[[+behaviour]]`
    &transition=`[[+transition]]`
    &lazyload=`[[+lazyload]]`
    &pagination=`[[+pagination]]`
    &responsive=`[[+responsive]]`
    &mobileOnly=`[[+mobile_only]]`
]]