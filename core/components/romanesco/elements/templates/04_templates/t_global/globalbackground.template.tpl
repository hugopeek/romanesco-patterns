<!DOCTYPE html>
<html id="[[*context_key]]" lang="[[++cultureKey]]">

[[[[If?
    &subject=`[[$headTheme]]`
    &operator=`isnull`
    &then=`$head`
    &else=`$headTheme`
]]]]

<body id="[[*alias]]" class="overview">

<div class="pusher">
    [[$headerBasic?
        &masthead=`0`
        &hero=`1`
        &search=`0`
    ]]

    [[[[If?
        &subject=`[[$toolbarBasicTheme]]`
        &operator=`isnull`
        &then=`$toolbarBasic`
        &else=`$toolbarBasicTheme`
    ]]]]

    <main id="main" role="main">
        <article id="content">
            [[*content]]
        </article>
    </main>

    [[[[If?
        &subject=`[[$footerTheme]]`
        &operator=`isnull`
        &then=`$footer`
        &else=`$footerTheme`
    ]]]]
</div>

[[$offCanvasNav]]
[[$script]]

</body>
</html>