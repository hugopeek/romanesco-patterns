<!DOCTYPE html>
<html lang="[[++cultureKey]]">

[[$head]]

<body id="header-vertical">

<div class="pusher">
    [[$headerVertical?
        &masthead=`0`
        &hero=`0`
        &search=`0`
    ]]

    <main id="main">
        [[$toolbarBasic]]

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