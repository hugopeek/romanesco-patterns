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
    [[$headerBasic]]

    [[[[modifiedIf?
        &subject=`toolbarBasicTheme`
        &operator=`iselement`
        &operand=`chunk`
        &then=`$toolbarBasicTheme`
        &else=`$toolbarBasic`
    ]]]]

    <main id="main" role="main">
        <div class="ui relaxed [[++sidebar_position:is=`left`:then=`computer reversed`]] grid container">
            <article id="content" class="sixteen wide mobile twelve wide computer column">
                [[$content]]
            </article>

            <aside id="sidebar" class="four wide computer column tablet or lower hidden">
                [[[[If?
                    &subject=`[[++submenu_locality]]`
                    &operator=`is`
                    &operand=`current`
                    &then=`$subNavVerticalLocal`
                    &else=`$subNavVertical`
                ]]?
                    &sticky=`[[*sidebar_sticky]]`
                ]]
                [[$ctaSidebar]]
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