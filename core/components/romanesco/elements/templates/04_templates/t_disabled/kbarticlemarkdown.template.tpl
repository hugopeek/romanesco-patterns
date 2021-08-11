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
            <div class="ui vertical stripe segment white markdown-body">
                <div class="ui container">
                    [[Markdown? &input=`[[*content:replace=``==&#96;`]]`]]
                </div>
            </div>

            <div class="ui vertical stripe segment secondary">
                <div class="ui container">
                    [[!TicketComments?
                        &tplComments=`commentWrapper`
                        &tplCommentAuth=`commentRowBasic`
                        &tplCommentGuest=`commentRowGuest`
                        &tplCommentForm=`commentForm`
                        &gravatarSize=`150`
                    ]]
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