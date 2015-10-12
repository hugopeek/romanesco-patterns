<!DOCTYPE html>
<html lang="[[++cultureKey]]">

[[$head]]

<body id="home">

<div class="pusher">
    [[$headerBasic?
        &masthead=`0`
        &hero=`1`
        &search=`0`
    ]]
    [[$subNav]]
    [[$offCanvasNav]]

    <main id="main" role="main">
        <article id="content">

            <h1 class="ui dividing header container">[[*pagetitle]]</h1>

            [[*content]]
        </article>
    </main>

    [[$footer]]
</div>

[[$script]]

</body>
</html>