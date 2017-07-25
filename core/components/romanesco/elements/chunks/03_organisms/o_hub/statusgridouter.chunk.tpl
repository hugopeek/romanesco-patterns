<svg class="hidden">
    [[!svgSanitize? &file=`assets/img/icons/status/not-done.svg` &title=`[[%romanesco.status.not_done]]` &toSymbol=`1`]]
    [[!svgSanitize? &file=`assets/img/icons/status/in-progress.svg` &title=`[[%romanesco.status.in_progress]]` &toSymbol=`1`]]
    [[!svgSanitize? &file=`assets/img/icons/status/almost-done.svg` &title=`[[%romanesco.status.almost_done]]` &toSymbol=`1`]]
    [[!svgSanitize? &file=`assets/img/icons/status/done.svg` &title=`[[%romanesco.status.done]]` &toSymbol=`1`]]
    [[!svgSanitize? &file=`assets/img/icons/status/successful.svg` &title=`[[%romanesco.status.successful]]` &toSymbol=`1`]]
    [[!svgSanitize? &file=`assets/img/icons/status/problematic.svg` &title=`[[%romanesco.status.problematic]]` &toSymbol=`1`]]
    [[!svgSanitize? &file=`assets/img/icons/status/expired.svg` &title=`[[%romanesco.status.expired]]` &toSymbol=`1`]]
</svg>



[[-
<div class="ui grid">
    <div class="ten wide column"></div>
    <div class="six wide column">
        <h4>Legend</h4>
        <table class="ui very compact celled legend table">
            <thead>
            <tr>
                <th></th>
            </tr>
            </thead>
        </table>
    </div>
</div>
]]

<table class="ui very compact sortable celled status table">
    <thead>
    <tr>
        <th>[[%romanesco.status.table_status_indicator]]</th>
        <th>[[%romanesco.status.table_id]]</th>
        <th>[[%romanesco.status.table_resource]]</th>
        <th>[[%romanesco.status.table_improvements]]</th>
        <th>[[%romanesco.status.table_assigned_user]]</th>
        <th>[[%romanesco.status.table_help]]</th>
        <th>[[%romanesco.status.table_notes]]</th>
    </tr>
    </thead>
    <tbody>
    [[pdoMenu?
        &contexts=`[[+context:default=`web`]]`
        &parents=`0`
        &showHidden=`1`
        &showUnpublished=`1`
        &includeTVs=`status_indicator,status_improvements,status_assigned_user,status_help,status_notes`
        &processTVs=`1`
        &tplOuter=`@INLINE [[+wrapper]]`
        &tpl=`statusGridRow`
        &where=`{"contentType:=":"text/html"}`
    ]]
    </tbody>
</table>

[[-statusGridLoadAssets]]