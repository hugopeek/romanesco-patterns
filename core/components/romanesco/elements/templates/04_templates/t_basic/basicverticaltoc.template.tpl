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

<body id="[[*alias]]" class="vertical toc">

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

        <div class="ui relaxed computer reversed grid container">
            <aside id="sidebar" class="sixteen wide mobile four wide computer column">
                [[$tocNavVertical?
                    &sticky=`1`
                ]]
            </aside>

            <article id="content" class="sixteen wide mobile twelve wide computer column">
                [[$content]]
            </article>
        </div>

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