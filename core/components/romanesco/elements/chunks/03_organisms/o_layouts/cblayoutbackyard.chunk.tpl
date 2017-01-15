[[+main]]

<div class="ui vertical content segment secondary">
    <div class="ui accordion">
        <div class="ui container title">
            <button class="ui tiny top attached button" tabindex="[[+idx]]">
                <i class="large info circle icon"></i>
            </button>
        </div>
        <div class="ui container content">
            <div class="ui two column stackable relaxed equal width grid">
                <section class="column">
                    <h2>[[+layout_title]]</h2>
                    [[+info]]
                </section>
                <aside class="[[+sidebar_width]] wide column">
                    <div class="ui middle aligned equal width grid">
                        <div class="nine wide column">
                            <a href="[[++site_url]]manager/?a=resource/update&id=[[*id]]" class="ui tiny basic button">
                                Edit in MODX
                            </a>
                        </div>
                        <div class="right aligned column">
                            <i class="disabled heart outline link icon with popup"
                               data-content="[[%romanesco.patterns.comment_tooltip]]"
                               data-position="top center"></i>
                            <i class="disabled comment outline link icon with popup"
                               data-content="[[%romanesco.patterns.comment_tooltip]]"
                               data-position="top center"></i>
                        </div>
                    </div>

                    <div class="ui divider"></div>

                    <h5 class="ui disabled header">ContentBlocks used</h5>

                    <div class="ui list">
                        [[+meta]]
                    </div>
                </aside>
            </div>
        </div>
    </div>
</div>