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

<body id="[[*alias]]" class="header-vertical toc">

[[$offCanvasNav]]

<div class="pusher">
    [[$headerVertical?
        &masthead=`0`
        &hero=`0`
        &search=`0`
    ]]

    <main id="main">
        [[[[If?
            &subject=`[[$toolbarBasicTheme]]`
            &operator=`isnull`
            &then=`$toolbarBasic`
            &else=`$toolbarBasicTheme`
        ]]]]

        <div class="ui relaxed grid container">
            <article id="content" class="sixteen wide mobile twelve wide computer column">
                [[*content]]
            </article>

            <aside id="sidebar" class="four wide computer column tablet or lower hidden">
                [[$tocNavVertical?
                    &sticky=`1`
                ]]
            </aside>
        </div>

        [[[[modifiedIf?
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