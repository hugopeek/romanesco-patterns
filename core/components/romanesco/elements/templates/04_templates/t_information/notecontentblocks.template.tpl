<!DOCTYPE html>
<html id="[[*context_key]]" lang="[[++cultureKey]]">

<head>
    [[[[If?
        &subject=`[[$headTheme]]`
        &operator=`isnull`
        &then=`$head`
        &else=`$headTheme`
    ]]]]
</head>

<body id="[[*alias]]" class="header-vertical note toc">

[[$offCanvasNav]]

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

        <div class="ui relaxed grid container">
            <article id="content" class="sixteen wide mobile twelve wide computer column">
                [[*content]]
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
                    <div id="[[++romanesco.[[++comment_platform:lcase]]_div_id]]"></div>
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

[[$script]]

</body>
</html>