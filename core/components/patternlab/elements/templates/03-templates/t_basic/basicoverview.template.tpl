<!DOCTYPE html>
<html lang="[[++cultureKey]]">

[[$head]]

<body id="overview">

<div class="pusher">
    [[$headerBasic?
        &masthead=`0`
        &hero=`1`
        &search=`0`
    ]]

    [[[[getResourceLevel:ne=`1`:then=`$toolbarBasic`]]]]

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