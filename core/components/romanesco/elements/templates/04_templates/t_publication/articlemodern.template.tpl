<!DOCTYPE html>
<html id="[[*context_key]]" lang="[[++cultureKey]]">

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

<body id="[[*alias]]" class="publication modern">

[[$offCanvasNav]]

<div class="pusher">
    [[$headerBasic]]

    [[[[modifiedIf?
        &subject=`toolbarBasicTheme`
        &operator=`iselement`
        &operand=`chunk`
        &then=`$toolbarBasicTheme`
        &else=`$toolbarBasic`
    ]]]]

    <main id="main">
        <article id="content">

            <header class="ui vertical stripe segment [[setBackground? &background=`[[++layout_background_default]]`]] introduction">
                <div class="ui main text container">
                    <h1 class="ui header">[[*pagetitle]]</h1>
                    <p class="subtitle muted">
                        [[%romanesco.article.written_by]]
                        <a href="[[~[[*author_id:empty=`[[++error_page]]`]]]]" rel="author">[[#[[*author_id]].pagetitle:empty=`[[++site_name]]`]]</a>
                        [[%romanesco.article.written_on]]
                        [[*publishedon:strtotime:date=`[[++romanesco.date_format_long]]`]]
                    </p>
                </div>
            </header>

            [[$content? &container_type=`text`]]

            [[[[If?
                &subject=`[[*author_id:empty=`0`]]`
                &operator=`notempty`
                &then=`getResources?
                    &resources=`[[*author_id:empty=`0`]]`
                    &tpl=`articleAuthorBio[[modifiedIf? &subject=`articleAuthorBioTheme` &operator=`iselement` &operand=`chunk` &then=`Theme` &else=``]]`
                    &includeTVs=`1`
                    &tvPrefix=``
                `
            ]]]]

            <footer class="ui vertical stripe segment grey inverted">
                <div class="ui tightened container">
                    <div class="ui bottom aligned equal width grid">
                        <div class="compact column">
                            <a href="[[~[[*parent]]]]" class="big basic ui back button" title="[[%romanesco.article.back_to_overview_title]]">
                                <i class="left arrow icon"></i>
                                <span class="mobile hidden">[[%romanesco.article.back_to_overview]]</span>
                            </a>
                        </div>
                        <div class="right aligned column">
                            [[$socialShareButtons? &button_type=`big basic`]]
                        </div>
                    </div>
                </div>
            </footer>

            [[*comments_toggle:eq=`1`:then=`
            <section id="comments" class="ui vertical stripe segment [[setBackground? &background=`[[++layout_background_default]]`]]">
                <div class="ui text container">
                    <h2 class="ui header">[[%romanesco.article.comments]]</h2>
                    <div id="[[++romanesco.[[++comment_platform:lcase]]_div_id]]"></div>
                </div>
            </section>
            `]]
        </article>

        [[[[If?
            &subject=`[[*neighbors_visibility]]`
            &operator=`eq`
            &operand=`1`
            &then=`$neighborsNav`
        ]]]]

        [[-
        <aside id="further-reading" class="ui vertical stripe segment grey inverted">
            <div class="ui tightened container">
                <div class="ui stackable very relaxed two column grid">
                    <div class="eight wide column">
                        <div class="ui disabled mini header">[[%romanesco.article.latest]]</div>
                        <div class="ui divided items">
                            [[-getResources?
                                &parents=`[[++romanesco.publication_container_id]]`
                                &resources=`[[+excluded_resources]]`
                                &tpl=`overviewRowArticleItemBasic`
                                &limit=`3`
                                &includeTVs=`1`
                                &processTVs=`1`
                                &showHidden=`1`
                                &sortby=`publishedon`
                                &sortdir=`DESC`

                                &column_type=`item`
                                &title_field=`pagetitle`
                                &title_hierarchy=`h4`
                                &meta_elements=`date`
                                &show_introtext=`0`
                            ]]
                        </div>
                    </div>
                    <div class="eight wide column">
                        <div class="ui disabled mini header">[[%romanesco.article.most_viewed]]</div>
                        <div class="ui divided items">
                            [[-getResources?
                                &parents=`-1`
                                &resources=`[[-Hits? &parents=`[[++romanesco.publication_container_id]]` &limit=`5` &outputSeparator=`,`]]`
                                &tpl=`overviewRowArticleItemBasic`
                                &limit=`3`
                                &includeTVs=`1`
                                &processTVs=`1`
                                &showHidden=`1`
                                &sortby=`FIELD(modResource.id, [[Hits? &parents=`[[++romanesco.publication_container_id]]` &limit=`5` &outputSeparator=`,`]] )`
                                &sortdir=`ASC`

                                &column_type=`item`
                                &title_field=`pagetitle`
                                &title_hierarchy=`h4`
                                &meta_elements=`date`
                                &show_introtext=`0`
                            ]]
                        </div>
                    </div>
                </div>
            </div>
        </aside>
        ]]
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