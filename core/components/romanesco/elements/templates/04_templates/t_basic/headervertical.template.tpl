<!DOCTYPE html>
<html lang="[[++cultureKey]]">

[[$head]]

<body id="header-vertical">

<div class="pusher">
    <div class="ui stackable equal width grid">
        <div class="four wide inverted primary column">
            [[$headerVertical?
                &masthead=`0`
                &hero=`0`
                &search=`0`
            ]]
        </div>

        <main id="main" class="column" role="main">
            <article id="content">
                [[*content]]
            </article>

            [[$footer]]
        </main>
    </div>
</div>

[[$offCanvasNav]]
[[$script]]

</body>
</html>