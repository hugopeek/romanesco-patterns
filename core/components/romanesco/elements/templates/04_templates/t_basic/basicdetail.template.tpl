<!DOCTYPE html>
<html lang="[[++cultureKey]]">

[[$head]]

<body id="[[*alias]]">

<div class="pusher">
    [[$headerBasic?
        &masthead=`0`
        &hero=`1`
        &search=`0`
    ]]

    [[[[getResourceLevel:ne=`1`:then=`$toolbarBasic`]]]]

    <main id="main" role="main">
        <div class="ui relaxed grid container">
            <article id="content" class="sixteen wide mobile twelve wide computer column">
                [[*content]]
            </article>

            <aside id="sidebar" class="four wide computer column tablet or lower hidden">
                [[$subNavVertical?
                    &sticky=`1`
                ]]
            </aside>
        </div>
    </main>

    [[$footer]]
</div>

[[$offCanvasNav]]
[[$script]]

</body>
</html>