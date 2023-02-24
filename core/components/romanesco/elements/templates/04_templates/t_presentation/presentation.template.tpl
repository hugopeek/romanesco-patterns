<!DOCTYPE html>
<html id="[[*context_key]]" lang="[[++cultureKey]]">

<head>
    [[[[modifiedIf?
        &subject=`headTheme`
        &operator=`iselement`
        &operand=`chunk`
        &then=`$headTheme`
        &else=`$head`
    ]]]]
</head>

<body id="[[*alias]]" class="presentation">

<div class="pusher">
    <main id="main">
        <article id="swiper-[[*id]]" class="swiper fullscreen">
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