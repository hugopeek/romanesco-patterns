<div class="ui [[+cols]] column [[+responsive:replace=`,== `]] [[+padding]] grid gallery [[+lightbox:eq=`1`:then=`with lightbox`]] [[+caption:eq=`1`:then=`with caption`]]">
    [[+rows]]
</div>


<div id="gallery-[[+unique_idx]]" class="ui fullscreen gallery modal">
    <div id="swiper-[[+unique_idx]]" class="swiper-container">
        <div class="swiper-wrapper">
            [[+rows]]
        </div>

        <div class="swiper-pagination"></div>

        <button class="swiper-button-next"></button>
        <button class="swiper-button-prev"></button>
    </div>
</div>

[[sliderLoadAssets?
    &swiperID=`swiper-[[+unique_idx]]`
    &behaviour=`loop,arrows`
    &lazyload=`0`
    &pagination=`bullets`
    &lightbox=`[[+lightbox]]`
]]