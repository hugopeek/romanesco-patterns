<!DOCTYPE html>
<html lang="[[++cultureKey]]">

[[$head]]

<body id="[[*alias]]" class="project-hub">

<div class="pusher">
    [[$headerBasic?
        &masthead=`0`
        &hero=`1`
        &search=`0`
    ]]

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