<section class="ui segment">
    <h2>
        <span class="idx">[[+idx]].</span>
        <a href="[[+link]]" title="[[+longtitle]]">[[+pagetitle]]</a>
    </h2>
    <p class="meta">
        [[#[[+parent]].pagetitle:notempty=`
        <span class="ui basic label"><i class="folder open icon"></i>[[#[[+parent]].pagetitle]]</span>
        `]]
    </p>
    <p class="extract"><em>[[+extract]]</em></p>
    <a class="primary ui button" href="[[+link]]" title="[[+longtitle]]">
        [[%romanesco.search.result_button_text]]
    </a>
</section>