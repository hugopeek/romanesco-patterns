<!DOCTYPE html>
<html id="[[*context_key]]" lang="[[++cultureKey]]">

[[[[If?
    &subject=`[[$headTheme]]`
    &operator=`isnull`
    &then=`$head`
    &else=`$headTheme`
]]]]

<body id="[[*alias]]" class="header-vertical note toc">

<div class="pusher">
    [[$headerVertical?
        &masthead=`0`
        &hero=`0`
        &search=`0`
    ]]

    <main id="main">
        [[[[If?
            &subject=`[[$toolbarKnowledgeBaseTheme]]`
            &operator=`isnull`
            &then=`$toolbarKnowledgeBase? &search_form_size=`large` &search_field_classes=`transparent``
            &else=`$toolbarKnowledgeBaseTheme`
        ]]]]

        <div id="content" class="ui relaxed grid container">
            <article class="sixteen wide mobile twelve wide computer column">
                <div class="ui vertical stripe segment white">
                    <div class="container">
                        [[*content]]
                    </div>
                </div>
            </article>

            <aside id="sidebar" class="four wide computer column tablet or lower hidden">
                [[$tocNavVertical?
                    &sticky=`1`
                ]]
            </aside>
        </div>

        [[*comments_toggle:eq=`1`:then=`
        <section id="comments" class="ui vertical stripe segment secondary">
            <h2 class="ui big header">[[%romanesco.article.comments]]</h2>
            <div class="ui relaxed grid container">
                <div class="sixteen wide mobile twelve wide computer column">
                    <div id="[[++romanesco.comment_platform_id]]"></div>
                </div>
            </div>
        </section>
        `]]

        [[[[If?
            &subject=`[[$footerTheme]]`
            &operator=`isnull`
            &then=`$footer`
            &else=`$footerTheme`
        ]]]]
    </main>
</div>

[[$offCanvasNav]]
[[$script]]

</body>
</html>