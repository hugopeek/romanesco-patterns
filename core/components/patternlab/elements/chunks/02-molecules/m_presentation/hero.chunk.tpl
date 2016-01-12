<div class="ui vertical stripe segment [[*header_background:empty=`[[++header_background_default]]`]]">
    [[If?
        &subject=`[[*header_cta]]`
        &operator=`isnot`
        &operand=`0`
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