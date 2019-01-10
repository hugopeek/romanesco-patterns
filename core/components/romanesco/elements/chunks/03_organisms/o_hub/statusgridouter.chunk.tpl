<svg class="hidden">
    [[svgSanitize? &file=`assets/components/romanescobackyard/icons/status/to-do.svg` &title=`[[%romanesco.status.not_done]]` &toSymbol=`1`]]
    [[svgSanitize? &file=`assets/components/romanescobackyard/icons/status/in-progress.svg` &title=`[[%romanesco.status.in_progress]]` &toSymbol=`1`]]
    [[svgSanitize? &file=`assets/components/romanescobackyard/icons/status/review.svg` &title=`[[%romanesco.status.almost_done]]` &toSymbol=`1`]]
    [[svgSanitize? &file=`assets/components/romanescobackyard/icons/status/done.svg` &title=`[[%romanesco.status.done]]` &toSymbol=`1`]]
    [[svgSanitize? &file=`assets/components/romanescobackyard/icons/status/successful.svg` &title=`[[%romanesco.status.successful]]` &toSymbol=`1`]]
    [[svgSanitize? &file=`assets/components/romanescobackyard/icons/status/problematic.svg` &title=`[[%romanesco.status.problematic]]` &toSymbol=`1`]]
    [[svgSanitize? &file=`assets/components/romanescobackyard/icons/status/expired.svg` &title=`[[%romanesco.status.expired]]` &toSymbol=`1`]]
</svg>

<div class="ui grid">
    <div class="eight wide column"></div>
    <div class="eight wide column">
        <h4>Status</h4>
        <table class="ui small center aligned very compact fixed basic legend table">
            <thead>
            <tr>
                <th>To do</th>
                <th>In progress</th>
                <th>Review</th>
                <th>Done</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    <svg class="icon" viewBox="0 0 100 100">
                        <use xlink:href="[[~[[*id]]? &scheme=`full`]]#status-to-do"></use>
                    </svg>
                </td>
                <td>
                    <svg class="icon" viewBox="0 0 100 100">
                        <use xlink:href="[[~[[*id]]? &scheme=`full`]]#status-in-progress"></use>
                    </svg>
                </td>
                <td>
                    <svg class="icon" viewBox="0 0 100 100">
                        <use xlink:href="[[~[[*id]]? &scheme=`full`]]#status-review"></use>
                    </svg>
                </td>
                <td>
                    <svg class="icon" viewBox="0 0 100 100">
                        <use xlink:href="[[~[[*id]]? &scheme=`full`]]#status-done"></use>
                    </svg>
                </td>
            </tr>
            </tbody>
            <thead>
            <tr></tr>
                <th>Healthy</th>
                <th>Fruiting</th>
                <th>Buggy</th>
                <th>Expired</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td class="positive">
                    <svg class="icon" viewBox="0 0 100 100">
                        <use xlink:href="[[~[[*id]]? &scheme=`full`]]#status-done"></use>
                    </svg>
                </td>
                <td class="positive">
                    <svg class="icon" viewBox="0 0 100 100">
                        <use xlink:href="[[~[[*id]]? &scheme=`full`]]#status-successful"></use>
                    </svg>
                </td>
                <td class="negative">
                    <svg class="icon" viewBox="0 0 100 100">
                        <use xlink:href="[[~[[*id]]? &scheme=`full`]]#status-problematic"></use>
                    </svg>
                </td>
                <td class="warning">
                    <svg class="icon" viewBox="0 0 100 100">
                        <use xlink:href="[[~[[*id]]? &scheme=`full`]]#status-expired"></use>
                    </svg>
                </td>

            </tr>
            </tbody>
        </table>
    </div>
</div>

<table class="ui very compact sortable celled status table">
    <thead>
    <tr>
        <th>[[%romanesco.status.table_status_indicator]]</th>
        <th>[[%romanesco.status.table_id]]</th>
        <th>[[-%romanesco.status.table_resource]]Page</th>
        <th>[[-%romanesco.status.table_improvements]]Improvements</th>
        <th>[[-%romanesco.status.table_help]]Issues</th>
        <th>[[-%romanesco.status.table_assigned_user]]Owner</th>
        <th>[[-%romanesco.status.table_notes]]Due date</th>
    </tr>
    </thead>
    <tbody>
    [[pdoMenu?
        &contexts=`[[+context:default=`web`]]`
        &parents=`0`
        &showHidden=`1`
        &showUnpublished=`1`
        &includeTVs=`status_progress,status_health,status_improvements,status_issues,content_owner,planning_date_completed`
        &processTVs=`1`
        &tplOuter=`@INLINE [[+wrapper]]`
        &tpl=`statusGridRow`
        &where=`{"contentType:=":"text/html"}`
    ]]
    </tbody>
</table>

[[-statusGridLoadAssets]]