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
        <article id="content" class="slider">
            [[*content]]
        </article>
    </main>
</div>

[[sliderLoadAssets]]
[[$script]]

</body>
</html>