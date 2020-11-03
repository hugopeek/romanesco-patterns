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
            &then=`$toolbarKnowledgeBase? &search_form_size=`large` &search_field_classes=`transparent``
            &else=`$toolbarKnowledgeBaseTheme`
        ]]]]

        <article id="content">
            [[*content:notempty=`
            <div class="ui vertical stripe segment white">
                <div class="ui container">
                    [[*content]]
                </div>
            </div>
            `]]

            [[!pdoPage?
                &element=`getTickets`
                &tpl=`kbOverviewRowBasic`
                &checkPermissions=`list`
            ]]

            <div class="ui vertical stripe segment white">
                <div class="ui container">
                    [[!+page.nav]]
                </div>
            </div>

        </article>

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