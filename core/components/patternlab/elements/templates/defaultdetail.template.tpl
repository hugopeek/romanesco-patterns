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
    [[$subNavHorizontal]]

    <main id="main" role="main">
        <article id="content">

            <div class="ui container">
                <h1 class="ui header huge">[[*longtitle:empty=`[[*pagetitle]]`]]</h1>
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