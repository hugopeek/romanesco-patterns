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
        <article id="content"
                 class="slider-basic fullscreen"
                 data-slick='{
                     "infinite": [[*slider_behaviour:contains=`infinite`:then=`true`:else=`false`]],
                     "arrows": [[*slider_behaviour:contains=`arrows`:then=`true`:else=`false`]],
                     "dots": [[*slider_behaviour:contains=`dots`:then=`true`:else=`false`]],
                     "fade": [[*slider_behaviour:contains=`fade`:then=`true`:else=`false`]],
                     "autoplay": [[*slider_behaviour:contains=`autoplay`:then=`true`:else=`false`]]
                 }'>
            [[*content]]
        </article>
    </main>
</div>

[[sliderLoadAssets]]
[[$script]]

</body>
</html>