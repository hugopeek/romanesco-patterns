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

<body id="[[*alias]]" class="detail">

[[$offCanvasNav]]

<div class="pusher">
    [[$headerBasic?
        &masthead=`0`
        &hero=`1`
        &search=`0`
    ]]

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
                [[*content]]
            </article>

            <aside id="sidebar" class="four wide computer column tablet or lower hidden">
                [[$subNavVertical?
                    &sticky=`1`
                ]]
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