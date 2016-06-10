<!DOCTYPE html>
<html lang="[[++cultureKey]]">

[[setTemplateType? &type=`detail`]]
[[$head]]

<body id="detail">

<div class="pusher">
    [[$headerBasic?
        &masthead=`0`
        &hero=`1`
        &search=`0`
    ]]

    [[[[getResourceLevel:ne=`1`:then=`$toolbarBasic`]]]]

    <main id="main" role="main">
        <div class="ui relaxed grid container">
            <article id="content" class="sixteen wide twelve wide computer column">
                [[*content]]
            </article>

            <aside id="sidebar" class="four wide column computer only">
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