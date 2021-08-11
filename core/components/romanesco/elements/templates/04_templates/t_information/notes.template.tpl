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

<body id="[[*alias]]" class="vertical notes">

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

        <article id="content">
            [[$content]]
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