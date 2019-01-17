<h3 id="[[+label]]" class="ui header">
    [[+label]]
</h3>

<table class="ui very compact celled table">
    <thead>
    <tr>
        <th class="four wide">Key</th>
        <th class="five wide">Label</th>
        <th class="seven wide">Description</th>
    </tr>
    </thead>
    <tbody>
    [[migxLoopCollection?
        &packageName=`clientconfig`
        &classname=`cgSetting`
        &where=`{"group":"[[+id]]"}`
        &tpl=`configSettingsRowTR`
    ]]
    </tbody>
</table>