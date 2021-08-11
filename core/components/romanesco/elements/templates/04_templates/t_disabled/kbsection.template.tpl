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

<body id="[[*alias]]" class="vertical">

[[$offCanvasNav]]

<div class="pusher">
    [[$headerVertical?
        &masthead=`0`
        &hero=`0`
        &search=`0`
    ]]

    <main id="main">
        [[[[If?
            &subject=`[[$toolbarNoteTheme]]`
            &operator=`isnull`
            &then=`$toolbarNote? &search_form_size=`large` &search_field_classes=`transparent``
            &else=`$toolbarNoteTheme`
        ]]]]

        <article id="content">
            [[*content:notempty=`
            <div class="ui vertical stripe segment white">
                <div class="ui container">
                    [[$content]]
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