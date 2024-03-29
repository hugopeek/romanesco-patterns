<div id="swiper-[[+unique_idx]]" class="swiper[[+mobile_only:eq=`1`:then=`-mobile`]] [[+inverted:eq=`1`:then=`inverted`]] [[+fullscreen:eq=`1`:then=`fullscreen`]]">
    [[If?
        &subject=`[[+slider_type]]`
        &operator=`inarray`
        &operand=`overview,gallery,cards`
        &then=`[[+main]]`
        &else=`<div class="swiper-wrapper[[+mobile_only:eq=`1`:then=`-mobile`]]">[[+main]]</div>`
    ]]

    [[+behaviour:containsnot=`navOutside`:then=`
        [[+pagination:isnot=`none`:then=`
        <div class="swiper-pagination swiper-[[+unique_idx]]"></div>
        `]]
        [[+behaviour:contains=`arrows`:then=`
        <button class="swiper-button-next swiper-[[+unique_idx]]"></button>
        <button class="swiper-button-prev swiper-[[+unique_idx]]"></button>
        `]]
    `]]

</div>

[[+behaviour:contains=`navOutside`:then=`
    [[+pagination:isnot=`none`:then=`
    <div class="swiper-pagination swiper-[[+unique_idx]] outside"></div>
    `]]
    [[+behaviour:contains=`arrows`:then=`
    <button class="swiper-button-next swiper-[[+unique_idx]] outside"></button>
    <button class="swiper-button-prev swiper-[[+unique_idx]] outside"></button>
    `]]
`]]

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