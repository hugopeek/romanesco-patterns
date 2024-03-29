<aside id="author-about" class="ui vertical stripe segment [[setBackground? &background=`[[++layout_background_default]]`]]">
    <div class="ui container">
        <div class="ui segment">
            <div class="ui two column equal width grid">
                <div class="compact column">
                    <a class="ui small image" href="[[~[[+id]]]]">
                        [[ImagePlus:empty=`[[$imgOverviewFallback? &img_type=`square`]]`?
                            &tvname=`person_image`
                            &docid=`[[+id]]`
                            &options=`w=400&h=400&q=[[++romanesco.img_quality]]&zc=1`
                            &type=`tpl`
                            &tpl=`imgOverviewFixed`
                        ]]
                    </a>
                    <p>[[$socialConnectButtonsPerson? &button_type=`basic`]]</p>
                </div>
                <div class="column">
                    <h2>[[%romanesco.article.about_author]], <a href="[[~[[+id]]]]">[[+menutitle:empty=`[[+pagetitle]]`]]</a></h2>
                    [[+introtext]]
                </div>
            </div>
        </div>
    </div>
</aside>