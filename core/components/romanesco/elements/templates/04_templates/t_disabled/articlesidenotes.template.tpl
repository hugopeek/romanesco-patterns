<!DOCTYPE html>
<html id="[[*context_key]]" lang="[[++cultureKey]]">

[[setUserPlaceholders? &userId=`[[*author_id]]`]]
[[!Hits? &punch=`[[*id]]`]]

<head>
    [[[[modifiedIf?
        &subject=`headTheme`
        &operator=`iselement`
        &operand=`chunk`
        &then=`$headTheme`
        &else=`$head`
    ]]]]
</head>

<body id="[[*alias]]" class="detail publication">

[[$offCanvasNav]]

<div class="pusher">
    [[$headerBasic?
        &masthead=`0`
        &hero=`1`
        &search=`0`
    ]]

    [[[[modifiedIf?
        &subject=`toolbarBasicTheme`
        &operator=`iselement`
        &operand=`chunk`
        &then=`$toolbarBasicTheme`
        &else=`$toolbarBasic`
    ]]]]

    <main id="main" role="main">
        <article id="content">

            <div class="ui container">
                <div class="ui two column grid">
                    <div class="column">
                        <a href="[[~[[*parent]]]]" class="basic ui button"><i class="icon left arrow"></i>[[%romanesco.article.back_to_overview]]</a>
                    </div>
                    <div class="right aligned column">
                        [[!$socialShareButtons? &button_type=`basic`]]
                    </div>
                </div>
            </div>

            <div class="ui introduction container">
                <h1 class="ui huge header">[[*pagetitle]]</h1>
                <p class="meta date"><em>[[*publishedon:strtotime:date=`%e %B %Y`]]</em></p>
            </div>

            [[*content]]

        </article>

        <aside class="ui container">
            [[[[*comments_toggle:isnot=`0`:then=`$commentsDisqus`]]]]
        </aside>

        <div class="ui vertical stripe segment white">
            <div class="ui container">
                <div class="ui two column grid">
                    <div class="column">
                        <a href="[[~[[*parent]]]]" class="primary ui button"><i class="icon left arrow"></i>[[%romanesco.article.back_to_overview]]</a>
                    </div>
                    <div class="right aligned column">
                        [[!$socialShareButtons]]
                    </div>
                </div>
            </div>
            
            <div class="ui container">
                <aside class="column">
                    
                </aside>
            </div>
        </div>
    </main>

    [[[[modifiedIf?
        &subject=`footerTheme`
        &operator=`iselement`
        &operand=`chunk`
        &then=`$footerTheme`
        &else=`$footer`
    ]]]]
</div>

[[$script]]

</body>
</html>