<!DOCTYPE html>
<html lang="[[++cultureKey]]">

[[$head]]

<body>

<div class="pusher">
    [[$headerBasic?
        &masthead=`0`
        &hero=`1`
        &search=`0`
    ]]

    <main id="main" role="main">
        <article id="content">

            <div class="ui container">
                <h1 class="ui main header huge">[[*pagetitle]]</h1>
            </div>

            [[*content]]
        </article>
    </main>

    [[$footer]]
</div>

[[$offCanvasNav]]
[[$script]]

</body>
</html>