<!DOCTYPE html>
<html id="[[*context_key]]" lang="[[++cultureKey]]">

<head>
    [[[[modifiedIf?
        &subject=`headTheme`
        &operator=`iselement`
        &operand=`chunk`
        &then=`$headTheme`
        &else=`$head`
    ]]]]
</head>

<body id="[[*alias]]" class="vertical note toc">

[[$offCanvasNav]]

<div class="pusher">
    [[$headerVertical]]

    <main id="main">
        [[[[modifiedIf?
            &subject=`toolbarNoteTheme`
            &operator=`iselement`
            &operand=`chunk`
            &then=`$toolbarNoteTheme`
            &else=`$toolbarNote? &search_form_size=`large` &search_field_classes=`transparent``
        ]]]]

        <div class="ui relaxed grid container">
            <article id="content" class="sixteen wide mobile twelve wide computer column">
                <div class="ui vertical stripe segment transparent">
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
                    <div id="[[++romanesco.[[++comment_platform:lcase]]_div_id]]"></div>
                </div>
            </div>
        </section>
        `]]

        [[[[modifiedIf?
            &subject=`footerTheme`
            &operator=`iselement`
            &operand=`chunk`
            &then=`$footerTheme`
            &else=`$footer`
        ]]]]
    </main>
</div>

[[$script]]

</body>
</html>