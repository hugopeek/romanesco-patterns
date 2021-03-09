<!DOCTYPE html>
<html id="[[*context_key]]" lang="[[++cultureKey]]">

[[setUserPlaceholders? &userId=`[[*author_id]]`]]
[[!Hits? &punch=`[[*id]]`]]

<head>
    [[[[If?
        &subject=`[[$headTheme]]`
        &operator=`isnull`
        &then=`$head`
        &else=`$headTheme`
    ]]]]
</head>

<body id="[[*alias]]" class="publication readability">

<div class="pusher">
    [[$headerBasic?
        &masthead=`0`
        &hero=`1`
        &search=`0`
    ]]

    [[[[If?
        &subject=`[[$toolbarBasicTheme]]`
        &operator=`isnull`
        &then=`$toolbarBasic`
        &else=`$toolbarBasicTheme`
    ]]]]

    <main id="main" role="main">
        <article id="content">

            <header class="ui vertical stripe segment [[setBackground? &background=`[[++layout_background_default]]`]] introduction">
                <div class="ui text container">
                    <h1 class="ui header">[[*pagetitle]]</h1>
                    <p class="meta date"><em>[[*publishedon:strtotime:date=`%e %B %Y`]]</em></p>
                </div>
            </header>

            [[*content]]

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

        [[*neighbors_visibility:eq=`1`:then=`
        <nav id="menu-neighbors" class="ui large fluid two item menu">
            [[pdoNeighbors?
                &loop=`0`
                &tplPrev=`neighborNavItemPrev`
                &tplNext=`neighborNavItemNext`
                &tplWrapper=`@INLINE [[+prev]][[+next]]`
                &sortby=`publishedon`
                &sortdir=`asc`
            ]]
        </nav>
        `]]

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
                                &meta_elements=`views`
                                &show_introtext=`0`
                            ]]
                        </div>
                    </div>
                </div>
            </div>
        </aside>
        ]]
    </main>

    [[[[If?
        &subject=`[[$footerTheme]]`
        &operator=`isnull`
        &then=`$footer`
        &else=`$footerTheme`
    ]]]]
</div>

[[$offCanvasNav]]
[[$script]]

</body>
</html>