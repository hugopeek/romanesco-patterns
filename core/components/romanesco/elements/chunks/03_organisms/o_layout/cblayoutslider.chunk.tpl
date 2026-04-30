<div id="swiper-[[+unique_idx]]" class="swiper[[+mobile_only:eq=`1`:then=`-mobile`]] [[+transition]] [[+inverted:eq=`1`:then=`inverted`]] [[+fullscreen:eq=`1`:then=`fullscreen`]]">
    [[If?
        &subject=`[[+transition]]`
        &operator=`eq`
        &operand=`parallax`
        &then=`<div class="[[setBackground? &background=`[[+background]]`]]" data-swiper-parallax="-25%"></div>`
    ]]
    [[If?
        &subject=`[[+slider_type]]`
        &operator=`inarray`
        &operand=`overview,gallery,cards`
        &then=`[[+main]]`
        &else=`<div class="swiper-wrapper[[+mobile_only:eq=`1`:then=`-mobile`]]">[[+main]]</div>`
    ]]
    [[[[If?
        &subject=`[[+button_position]]`
        &operator=`contains`
        &operand=`inside`
        &then=`$sliderNavButtons?
            &position=`[[+button_position]]`
            &behaviour=`[[+behaviour]]`
            &pagination=`[[+pagination]]`
            &uid=`[[+unique_idx]]`
        `
    ]]]]
</div>

[[[[If?
    &subject=`[[+button_position]]`
    &operator=`contains`
    &operand=`outside`
    &then=`$sliderNavButtons?
        &position=`[[+button_position]]`
        &behaviour=`[[+behaviour]]`
        &pagination=`[[+pagination]]`
        &uid=`[[+unique_idx]]`
    `
]]]]

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