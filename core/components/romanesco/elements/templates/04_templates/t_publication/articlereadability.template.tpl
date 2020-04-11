<!DOCTYPE html>
<html id="[[*context_key]]" lang="[[++cultureKey]]">

[[setUserPlaceholders? &userId=`[[*author_id]]`]]
[[!Hits? &punch=`[[*id]]`]]

[[[[If?
    &subject=`[[$headTheme]]`
    &operator=`isnull`
    &then=`$head`
    &else=`$headTheme`
]]]]

<body id="[[*alias]]" class="publication readability">

<div class="pusher">
    [[$headerBasic?
        &masthead=`0`
        &hero=`1`
        &search=`0`
    ]]

    [[[[If?
        &subject=`[[$toolbarBasicTheme]]`
        &operator=`isnull`
        &then=`$toolbarBasic`
        &else=`$toolbarBasicTheme`
    ]]]]

    <main id="main" role="main">
        <article id="content">

            <header class="ui vertical stripe segment [[++layout_background_default]] introduction">
                <div class="ui text container">
                    <h1 class="ui header">[[*pagetitle]]</h1>
                    <p class="meta date"><em>[[*publishedon:strtotime:date=`%e %B %Y`]]</em></p>
                </div>
            </header>

            [[*content]]

            <footer class="ui vertical stripe segment secondary">
                <div class="ui text container">
                    <div class="ui equal width grid">
                        <div class="compact column">
                            <a href="[[~[[*parent]]]]" class="big basic ui button"><i class="icon left arrow"></i>[[%romanesco.article.back_to_overview]]</a>
                        </div>
                        <div class="right aligned column">
                            [[$socialShareButtons? &button_type=`big basic`]]
                        </div>
                    </div>
                </div>
            </footer>
        </article>

        [[*comments_toggle:eq=`1`:then=`
        <section id="comments" class="ui vertical stripe segment white">
            <div class="ui text container">
                <h2 class="ui header">[[%romanesco.article.comments]]</h2>
                <div id="[[++romanesco.[[++comment_platform:lcase]]_div_id]]"></div>
            </div>
        </section>
        `]]
    </main>

    [[[[If?
        &subject=`[[$footerTheme]]`
        &operator=`isnull`
        &then=`$footer`
        &else=`$footerTheme`
    ]]]]
</div>

[[$offCanvasNav]]
[[$script]]

</body>
</html>