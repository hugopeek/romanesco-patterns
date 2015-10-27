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
        <div class="ui container grid">
            <article class="sixteen wide twelve wide computer column">

                <h1 class="ui main header huge">[[*pagetitle]]</h1>

                [[*content]]
            </article>

            <aside class="four wide column computer only">
                [[$subNavVertical]]
            </aside>
        </div>
    </main>

    [[$footer]]
</div>

[[$offCanvasNav]]
[[$script]]

</body>
</html>