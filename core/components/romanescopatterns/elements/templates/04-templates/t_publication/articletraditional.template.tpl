<!DOCTYPE html>
<html lang="[[++cultureKey]]">

[[setTemplateType? &type=`detail`]]
[[setUserPlaceholders? &userId=`[[*article_author]]`]]
[[!Hits? &punch=`[[*id]]`]]

[[$head]]

<body id="publication-detail">

<div class="pusher">
    [[$headerBasic?
        &masthead=`0`
        &hero=`1`
        &search=`0`
    ]]

    [[[[getResourceLevel:ne=`1`:then=`$toolbarBasic`]]]]

    <main id="main" role="main">
        <div class="ui very relaxed grid container">
            <article id="content" class="sixteen wide mobile eleven wide computer publication column">

                <header class="publication introduction">
                    <h1 class="ui huge header">[[*pagetitle]]</h1>
                    <p class="meta">

                        <span class="author">
                            <a href="[[~[[+team_member_id]]]]" class="ui avatar image">
                                <img src="[[ImagePlus:empty=`[[++overview_img_fallback]]`? &tvname=`team_member_image` &docid=`[[+team_member_id]]` &options=`w=150&h=150&zc=1` &type=`thumb`]]">
                            </a>
                            [[*article_author:userinfo=`fullname`:empty=`[[++site_name]]`]]
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
                </header>

                [[*content]]

                [[+team_member_id:notempty=`
                <aside id="author-about" class="ui segment">
                    <div class="ui two column equal width grid">
                        <div class="four wide column">
                            <a href="[[~[[+team_member_id]]]]" class="ui image">
                                <img src="[[ImagePlus:empty=`[[++overview_img_fallback]]`? &tvname=`team_member_image` &docid=`[[+team_member_id]]` &options=`w=400&h=400&zc=1` &type=`thumb`]]">
                            </a>
                        </div>
                        <div class="column">
                            [[getResources?
                                &resources=`[[+team_member_id]]`
                                &tpl=`articleAuthorBio`
                                &includeTVs=`1`
                            ]]
                        </div>
                    </div>
                </aside>
                `]]

                [[*article_comments:isnot=`0`:then=`
                <section id="comments" class="ui vertical stripe segment white">
                    <h2 class="ui big header">[[%patternlab.article.comments]]</h2>
                    [[$articleCommentsDisqus]]
                </section>
                `]]

                <footer class="ui vertical stripe segment white">
                    <div class="ui two column grid">
                        <div class="column">
                            <a href="[[~[[*parent]]]]" class="primary ui button"><i class="icon left arrow"></i>[[%patternlab.article.back_to_overview]]</a>
                        </div>
                        <div class="right aligned column">
                            [[!$socialShareButtons]]
                        </div>
                    </div>
                </footer>
            </article>

            <aside id="sidebar" class="sixteen wide mobile five wide computer column">
                <section class="ui equal width middle aligned large screen only grid">
                    <div class="column">
                        <h3 class="ui tiny header">
                            [[%patternlab.article.share_this]]
                        </h3>
                    </div>
                    <div class="right aligned column">
                        [[!$socialShareButtons? &button_type=`basic`]]
                    </div>
                </section>

                <section class="ui vertical stripe segment white">
                    [[$dividerHeading?
                        &divider_section=`section`
                        &divider_icon_class=`tags icon`
                        &divider_icon_circular=`1`
                    ]]
                    <div class="ui labels">
                        [[!TaggerGetTags?
                            &groups=`2`
                            &target=`[[*parent]]`
                            &rowTpl=`tagItemCountLinkHighlight`
                        ]]
                    </div>
                </section>

                <section class="ui vertical stripe segment white">
                    <h3>[[%patternlab.article.read_another]]</h3>

                    <div class="ui top attached tabular menu">
                        <a class="item active"
                           data-tab="segment-publication-1"
                           role="tab"
                           aria-selected="false">
                            [[%patternlab.article.latest]]
                        </a>
                        <a class="item"
                           data-tab="segment-publication-2"
                           role="tab"
                           aria-selected="false">
                            [[%patternlab.article.most_viewed]]
                        </a>
                    </div>

                    <div class="ui bottom attached active tab segment"
                         data-tab="segment-publication-1"
                         role="tabpanel"
                         aria-hidden="false">
                        <div class="ui divided items">
                            [[getResources?
                                &parents=`[[++patternlab.publication_container_id]]`
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
                                &resources=`[[Hits? &parents=`[[++patternlab.publication_container_id]]` &limit=`5` &outputSeparator=`,`]]`
                                &tpl=`overviewRowArticleItemBasic`
                                &includeTVs=`1`
                                &processTVs=`1`
                                &showHidden=`1`
                                &sortby=`FIELD(modResource.id, [[Hits? &parents=`[[++patternlab.publication_container_id]]` &limit=`5` &outputSeparator=`,`]] )`
                                &sortdir=`ASC`

                                &column_type=`item`
                                &title_field=`pagetitle`
                                &title_hierarchy=`h4`
                                &meta_elements=`views`
                                &show_introtext=`0`
                            ]]
                        </div>
                    </div>
                </section>
            </aside>
        </div>
    </main>

    [[$footer]]
</div>

[[$offCanvasNav]]
[[$script]]

</body>
</html>