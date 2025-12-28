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

<body id="[[*alias]]" class="vertical">

[[$offCanvasNav]]

<div class="pusher">
    [[$headerVertical]]

    <main id="main">
        [[[[If?
            &subject=`toolbarBasicTheme`
            &operator=`iselement`
            &operand=`chunk`
            &then=`$toolbarBasicTheme`
            &else=`$toolbarBasic`
        ]]]]

        <article id="content">
            [[$content]]
        </article>

        [[[[If?
            &subject=`footerTheme`
            &operator=`iselement`
            &operand=`chunk`
            &then=`$footerTheme`
            &else=`$footer`
        ]]]]
    </main>
</div>

[[$script]]

</body>
</html>