<!DOCTYPE html>
<html id="[[*context_key]]" lang="[[++cultureKey]]">

[[[[If?
    &subject=`[[$headTheme]]`
    &operator=`isnull`
    &then=`$head`
    &else=`$headTheme`
]]]]

<body id="[[*alias]]" class="presentation">

<div class="pusher">
    <main id="main" role="main">
        <article id="swiper-[[*id]]" class="swiper-container fullscreen">
            <div id="content" class="swiper-wrapper">
                [[*content]]
            </div>

            [[*slider_pagination:isnot=`none`:then=`
            <div class="swiper-pagination swiper-[[*id]]"></div>
            `]]

            [[*slider_behaviour:contains=`arrows`:then=`
            <button class="swiper-button-next swiper-[[*id]]"></button>
            <button class="swiper-button-prev swiper-[[*id]]"></button>
            `]]
        </article>
    </main>
</div>

[[$script]]
[[sliderLoadAssets?
    &uid=`[[*id]]`
    &columns=`1`
    &slidesToScroll=`1`
    &direction=`horizontal`
    &watchOverflow=`false`
    &behaviour=`[[*slider_behaviour]]`
    &transition=`[[*slider_transition]]`
    &pagination=`[[*slider_pagination]]`
]]

</body>
</html>