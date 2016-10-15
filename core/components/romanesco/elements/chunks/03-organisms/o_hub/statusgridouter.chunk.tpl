<table class="ui very compact sortable celled table">
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