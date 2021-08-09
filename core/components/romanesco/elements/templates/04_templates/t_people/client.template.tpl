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

<body id="[[*alias]]" class="detail organization">

[[$offCanvasNav]]

<div class="pusher">
    [[$headerBasic]]

    [[[[modifiedIf?
        &subject=`toolbarBasicTheme`
        &operator=`iselement`
        &operand=`chunk`
        &then=`$toolbarBasicTheme`
        &else=`$toolbarBasic`
    ]]]]

    <main id="main" role="main">
        <div class="ui relaxed grid container">
            <article id="content" class="sixteen wide mobile twelve wide computer column">
                [[$content]]
            </article>

            <aside id="sidebar" class="four wide computer column tablet or lower hidden">
                [[$subNavVertical]]
            </aside>
        </div>
    </main>

    [[[[modifiedIf?
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