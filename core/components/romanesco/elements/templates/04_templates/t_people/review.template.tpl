<!DOCTYPE html>
<html id="[[*context_key]]" lang="[[++cultureKey]]">

<head>
    [[[[If?
        &subject=`headTheme`
        &operator=`iselement`
        &operand=`chunk`
        &then=`$headTheme`
        &else=`$head`
    ]]]]
</head>

<body id="[[*alias]]" class="detail testimonial">

[[$offCanvasNav]]

<div class="pusher">
    [[$headerBasic]]

    [[[[If?
        &subject=`toolbarBasicTheme`
        &operator=`iselement`
        &operand=`chunk`
        &then=`$toolbarBasicTheme`
        &else=`$toolbarBasic`
    ]]]]

    <main id="main">
        <div class="ui relaxed grid container">
            <article id="content" class="sixteen wide twelve wide computer column">
                [[$content]]
            </article>

            <aside id="sidebar" class="four wide column computer only">
                [[$subNavVertical]]
            </aside>
        </div>
    </main>

    [[[[If?
        &subject=`footerTheme`
        &operator=`iselement`
        &operand=`chunk`
        &then=`$footerTheme`
        &else=`$footer`
    ]]]]
</div>

[[$script]]

</body>
</html>