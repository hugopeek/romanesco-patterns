<table class="ui very compact sortable celled table">
    <thead>
    <tr>
        <th>[[%patternlab.status.table_status_indicator]]</th>
        <th>[[%patternlab.status.table_id]]</th>
        <th>[[%patternlab.status.table_resource]]</th>
        <th>[[%patternlab.status.table_improvements]]</th>
        <th>[[%patternlab.status.table_assigned_user]]</th>
        <th>[[%patternlab.status.table_help]]</th>
        <th>[[%patternlab.status.table_notes]]</th>
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
    ]]
    </tbody>
</table>

[[-statusGridLoadAssets]]