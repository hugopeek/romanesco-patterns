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
    [[[[modifiedIf?
        &subject=`[[+behaviour]]`
        &operator=`containsnot`
        &operand=`navOutside`
        &then=`$sliderNavButtons?
            &position=`inside`
            &behaviour=`[[+behaviour]]`
            &pagination=`[[+pagination]]`
            &uid=`[[+unique_idx]]`
        `
    ]]]]
</div>

[[[[modifiedIf?
    &subject=`[[+behaviour]]`
    &operator=`contains`
    &operand=`navOutside`
    &then=`$sliderNavButtons?
        &position=`outside`
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