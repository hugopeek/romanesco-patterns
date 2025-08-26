<aside id="author-bio" class="ui vertical stripe segment [[setBackground? &background=`[[++layout_background_default]]`]]">
    <div class="ui container">
        <div class="ui padded segment">
            <div class="ui two column stretched equal width grid">
                <div class="compact center aligned column">
                    <a class="ui small image" href="[[~[[+id]]]]">
                        [[ImagePlus:empty=`[[$imgOverviewFallback? &img_type=`square` &uid=`[[+uid]]`]]`?
                            &tvname=`person_image`
                            &docid=`[[+id]]`
                            &options=`w=400&h=400&q=[[++romanesco.img_quality]]&zc=1`
                            &type=`tpl`
                            &tpl=`imgOverviewFixed`
                        ]]
                    </a>
                    <p>[[$socialConnectButtons? &button_type=`basic`]]</p>
                </div>
                <div class="column">
                    <h3>[[%romanesco.article.about_author? &author_name=`<a href="[[~[[+id]]]]">[[+menutitle:empty=`[[+pagetitle]]`]]</a>`]]</h3>
                    [[+introtext]]
                </div>
            </div>
        </div>
    </div>
</aside>