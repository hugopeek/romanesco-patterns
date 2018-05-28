<!DOCTYPE html>
<html id="[[*context_key]]" lang="[[++cultureKey]]">

[[$head]]

<body id="[[*alias]]" class="header-vertical">

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
            &then=`$toolbarKnowledgeBase`
            &else=`$toolbarKnowledgeBaseTheme`
        ]]]]

        <article id="content">
            <div class="ui vertical stripe segment white">
                [[*content]]

                [[!pdoPage?
                    &element=`getTickets`
                ]]

                [[!+page.nav]]
            </div>

        </article>

        [[$footer]]
    </main>
</div>

[[$offCanvasNav]]
[[$script]]

</body>
</html>