<!DOCTYPE html>
<html id="[[*context_key]]" lang="[[++cultureKey]]">

<head>
    [[[[If?
        &subject=`[[$headTheme]]`
        &operator=`isnull`
        &then=`$head`
        &else=`$headTheme`
    ]]]]
</head>

<body id="[[*alias]]" class="detail person">

[[$offCanvasNav]]

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
        <div class="ui relaxed grid container">
            <article id="content" class="sixteen wide mobile twelve wide computer column">
                [[*content]]
            </article>

            <aside id="sidebar" class="four wide computer column tablet or lower hidden">
                [[$subNavVertical]]
            </aside>
        </div>
    </main>

    [[[[If?
        &subject=`[[$footerTheme]]`
        &operator=`isnull`
        &then=`$footer`
        &else=`$footerTheme`
    ]]]]
</div>

[[$script]]

</body>
</html>