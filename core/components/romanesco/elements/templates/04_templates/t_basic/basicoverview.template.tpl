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

<body id="[[*alias]]" class="overview">

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
        <article id="content">
            [[$content]]
        </article>
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