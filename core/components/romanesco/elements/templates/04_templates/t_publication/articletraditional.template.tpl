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

<body id="[[*alias]]" class="publication detail">

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

    <main id="main" role="main">
        <div class="ui very relaxed grid container">
            <article id="content" class="sixteen wide mobile eleven wide computer publication column">

                <header class="ui vertical stripe segment [[setBackground? &background=`[[++layout_background_default]]`]] introduction">

                    <div class="ui container">
                        <h1 class="ui header">[[*pagetitle]]</h1>

                        <p class="meta">
                            <span class="author">
                                [[[[If?
                                    &subject=`[[+team_member_id]]`
                                    &operator=`notempty`
                                    &then=`$imgOverviewPersonAvatarLink? &id=`[[+team_member_id]]``
                                ]]]]
                                [[If?
                                    &subject=`[[*author_id]]`
                                    &operator=`notempty`
                                    &then=`[[*author_id:userinfo=`fullname`]]`
                                    &else=`<i class="user icon"></i> [[*createdby:userinfo=`fullname`:empty=`[[++site_name]]`]]`
                                ]]
                            </span>
                            <span class="date">
                                <i class="calendar icon"></i>
                                [[*publishedon:strtotime:date=`%e %B %Y`]]
                            </span>
                            <span class="views">
                                <i class="eye icon"></i>
                                [[!Rowboat?
                                    &table=`modx_hits`
                                    &tpl=`hitCount`
                                    &limit=`1`
                                    &columns=`hit_count`
                                    &where=`{"hit_key":"[[*id]]"}`
                                    &cacheResults=`0`
                                ]]
                            </span>
                        </p>
                    </div>
                </header>

                [[$content]]

                [[[[If?
                    &subject=`[[+team_member_id:empty=`0`]]`
                    &operator=`notempty`
                    &then=`getResources?
                        &resources=`[[+team_member_id:empty=`0`]]`
                        &tpl=`[[modifiedIf? &subject=`articleAuthorBioTheme` &operator=`iselement` &operand=`chunk` &then=`articleAuthorBioTheme` &else=`articleAuthorBio`]]`
                        &includeTVs=`1`
                        &tvPrefix=``
                    `
                ]]]]

                [[*comments_toggle:eq=`1`:then=`
                <section id="comments" class="ui vertical stripe segment [[setBackground? &background=`[[++layout_background_default]]`]]">
                    <div class="ui container">
                        <h2 class="ui big header">[[%romanesco.article.comments]]</h2>
                        <div id="[[++romanesco.[[++comment_platform:lcase]]_div_id]]"></div>
                    </div>
                </section>
                `]]

                <footer class="ui vertical stripe segment [[setBackground? &background=`[[++layout_background_default]]`]]">
                    <div class="ui container">
                        <div class="ui two column equal width bottom aligned grid">
                            <div class="compact column">
                                <a href="[[~[[*parent]]]]" class="primary ui back button">
                                    <i class="icon left arrow"></i>
                                    <span class="mobile hidden">[[%romanesco.article.back_to_overview]]</span>
                                </a>
                            </div>
                            <div class="right aligned column">
                                [[$socialShareButtons]]
                            </div>
                        </div>
                    </div>
                </footer>
            </article>

            <aside id="sidebar" class="sixteen wide mobile five wide computer column">
                <section class="ui vertical stripe segment [[setBackground? &background=`[[++layout_background_default]]`]] tablet or lower hidden">
                    <div class="ui container">
                        <div class="ui equal width middle aligned grid">
                            <div class="compact column">
                                <h4 class="ui disabled mini header">
                                    <span class="large screen and widescreen only">[[%romanesco.article.share_this]]</span>
                                    <span class="computer only">[[%romanesco.article.share_this_short]]</span>
                                </h4>
                            </div>
                            <div class="right aligned column">
                                [[$socialShareButtons? &button_type=`basic`]]
                            </div>
                        </div>
                    </div>
                </section>

                [[-
                <section class="ui vertical stripe segment [[++layout_background_default]]">
                    <div class="ui container">
                        [[-$dividerHeading?
                            &divider_section=`section`
                            &divider_icon_class=`tags icon`
                            &divider_icon_circular=`1`
                        ]]
                        <div class="ui labels">
                            [[-!TaggerGetTags?
                                &groups=`2`
                                &target=`[[*parent]]`
                                &rowTpl=`tagItemCountLinkHighlight`
                            ]]
                        </div>
                    </div>
                </section>
                ]]

                <section class="ui vertical stripe segment [[setBackground? &background=`[[++layout_background_default]]`]]">
                    <div class="ui container">
                        <h3>[[%romanesco.article.read_another]]</h3>

                        <div class="ui two item top attached tabular menu">
                            <a class="item active"
                               data-tab="segment-publication-1"
                               role="tab"
                               aria-selected="false">
                                [[%romanesco.article.latest]]
                            </a>
                            <a class="item"
                               data-tab="segment-publication-2"
                               role="tab"
                               aria-selected="false">
                                [[%romanesco.article.most_viewed]]
                            </a>
                        </div>

                        <div class="ui bottom attached active tab segment"
                             data-tab="segment-publication-1"
                             role="tabpanel"
                             aria-hidden="false">
                            <div class="ui divided items">
                                [[getResources?
                                    &parents=`[[++romanesco.publication_container_id]]`
                                    &resources=`[[+excluded_resources]]`
                                    &tpl=`overviewRowArticleItemBasic`
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
                        <div class="ui bottom attached tab segment"
                             data-tab="segment-publication-2"
                             role="tabpanel"
                             aria-hidden="false">
                            <div class="ui divided items">
                                [[getResources?
                                    &parents=`-1`
                                    &resources=`[[Hits? &parents=`[[++romanesco.publication_container_id]]` &limit=`5` &outputSeparator=`,`]]`
                                    &tpl=`overviewRowArticleItemBasic`
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

                </section>
            </aside>
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