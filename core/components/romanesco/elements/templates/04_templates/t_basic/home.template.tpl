<!DOCTYPE html>
<html id="[[*context_key]]" lang="[[++cultureKey]]">

[[$head]]

<body id="home">

<div class="pusher">
    [[$headerBasic?
        &masthead=`0`
        &hero=`1`
        &search=`0`
    ]]

    [[[[If?
        &subject=`[[$toolbarBasicTheme]]`
        &operator=`isnull`
        &then=`$toolbarBasic`
        &else=`$toolbarBasicTheme`
    ]]]]

    <main id="main" role="main">
        <article id="content">
            [[*content]]
        </article>
    </main>

    [[$footer]]
</div>

[[$offCanvasNav]]
[[$script]]

</body>
</html>