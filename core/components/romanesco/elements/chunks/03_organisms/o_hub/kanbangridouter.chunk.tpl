<svg class="hidden">
    [[!svgSanitize? &file=`assets/img/icons/status/not-done.svg` &title=`[[%romanesco.status.not_done]]` &toSymbol=`1`]]
    [[!svgSanitize? &file=`assets/img/icons/status/in-progress.svg` &title=`[[%romanesco.status.in_progress]]` &toSymbol=`1`]]
    [[!svgSanitize? &file=`assets/img/icons/status/almost-done.svg` &title=`[[%romanesco.status.almost_done]]` &toSymbol=`1`]]
    [[!svgSanitize? &file=`assets/img/icons/status/done.svg` &title=`[[%romanesco.status.done]]` &toSymbol=`1`]]
    [[!svgSanitize? &file=`assets/img/icons/status/successful.svg` &title=`[[%romanesco.status.successful]]` &toSymbol=`1`]]
    [[!svgSanitize? &file=`assets/img/icons/status/problematic.svg` &title=`[[%romanesco.status.problematic]]` &toSymbol=`1`]]
    [[!svgSanitize? &file=`assets/img/icons/status/expired.svg` &title=`[[%romanesco.status.expired]]` &toSymbol=`1`]]
</svg>

<div class="ui top attached steps">
    [[migxLoopCollection?
        &packageName=`romanescobackyard`
        &classname=`rmOption`
        &where=`{"key":"status_progress"}`
        &tpl=`@CODE:
        <div class="step">
            <div class="content">
                <div class="title">[[+name]]</div>
                <div class="description">[[+description]]</div>
            </div>
        </div>`
    ]]
</div>
<div class="ui stackable equal width celled grid">
    [[migxLoopCollection?
        &packageName=`romanescobackyard`
        &classname=`rmOption`
        &where=`{"key":"content_priority"}`
        &tpl=`kanbanGridRow`
    ]]
</div>
