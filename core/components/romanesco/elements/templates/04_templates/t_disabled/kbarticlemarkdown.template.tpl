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