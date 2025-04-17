[[+main]]

<div class="ui vertical backyard segment secondary">
    <div class="ui container">
        <div class="ui accordion">
            <div class="title">
                <button class="ui small primary circular icon button" tabindex="[[+idx]]">
                    <i class="plus icon"></i>
                </button>
            </div>
            <div class="content">
                <div class="ui stackable relaxed equal width grid">
                    <section class="column">
                        <h2>[[+layout_title]]</h2>
                        [[+info]]
                    </section>
                    <aside class="[[+sidebar_width]] wide column">
                        <div class="ui nested middle aligned equal width toolbar grid">
                            <div class="nine wide column">
                                <a href="[[++site_url]]manager/?a=resource/update&id=[[*id]]" class="ui tiny basic button">
                                    Edit in MODX
                                </a>
                            </div>
                            <div class="right aligned column">
                                <span data-tooltip="[[%romanesco.patterns.favorite_tooltip]]" data-position="top center">
                                    <i class="disabled heart outline link icon"></i>
                                </span>
                                <span data-tooltip="[[%romanesco.patterns.comment_tooltip]]" data-position="top center">
                                    <i class="disabled comment outline link icon"></i>
                                </span>
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
</div>