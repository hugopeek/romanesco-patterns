<!DOCTYPE html>
<html id="[[*context_key]]" class="no-js" lang="[[++cultureKey]]">

<head>
    [[[[If?
        &subject=`headTheme`
        &operator=`iselement`
        &operand=`chunk`
        &then=`$headTheme`
        &else=`$head`
    ]]]]
</head>

<body id="[[*alias]]" class="detail note toc">

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