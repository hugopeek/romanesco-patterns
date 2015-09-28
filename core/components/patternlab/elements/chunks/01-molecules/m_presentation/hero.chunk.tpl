<div class="ui inverted vertical segment violet">
    [[If?
        &subject=`[[*header_cta]]`
        &operator=`notempty`
        &then=`[[$ctaHeader]]`
        &else=`
        <div class="ui grid container">
            <div class="ten wide column">
                <div class="ui large inverted header">[[*header_title]]</div>
                <p>[[*header_subtitle]]</p>
            </div>
            <div class="six wide column">
                <img src="[[*header_image]]" alt="[[+pagetitle]]">
            </div>
        </div>`
    ]]
</div>