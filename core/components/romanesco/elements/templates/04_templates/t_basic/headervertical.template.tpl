<!DOCTYPE html>
<html id="[[*context_key]]" lang="[[++cultureKey]]">

[[$head]]

<body id="[[*alias]]" class="header-vertical">

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

        <article id="content">
            [[*content]]
        </article>

        [[$footer]]
    </main>
</div>

[[$offCanvasNav]]
[[$script]]

</body>
</html>