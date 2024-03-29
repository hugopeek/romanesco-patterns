[[Switch:toPlaceholder=`status_priority_[[+idx]]`?
    &get=`[[+status_progress:eq=`done`:then=`[[+status_health]]`:else=`[[+status_progress]]`]]`
    &c1=`todo`          &do1=`4`
    &c2=`doing`         &do2=`2`
    &c3=`review`        &do3=`1`
    &c4=`stable`        &do4=`5`
    &c5=`successful`    &do5=`6`
    &c6=`problematic`   &do6=`3`
    &c7=`expired`       &do7=`7`
    &default=`0`
]]
[[Switch:toPlaceholder=`status_class_[[+idx]]`?
    &get=`[[+status_progress:eq=`done`:then=`[[+status_health]]`:else=`[[+status_progress]]`]]`
    &c1=`stable`        &do1=`positive`
    &c2=`successful`    &do2=`positive`
    &c3=`problematic`   &do3=`negative`
    &c4=`expired`       &do4=`warning`
    &default=``
]]

[[SeoTabIndexation:toPlaceholder=`status_indexation_[[+idx]]`? &resource=`[[+id]]`]]

[[migxLoopCollection?
    &packageName=`romanescobackyard`
    &classname=`rmTask`
    &where=`{"resource_id":"[[+id]]"}`
    &tpl=`tagItemTooltip`
    &toPlaceholder=`status_tasks_[[+idx]]`
]]

<tr class="[[+status_class_[[+idx]]]][[+published:eq=`0`:then=` disabled`]]">
    <td class="indicator">
        <svg class="icon" viewBox="0 0 100 100">
            [[+status_progress:eq=`done`:then=`
            <use xlink:href="[[~[[*id]]? &scheme=`full`]]#status-[[+status_health:replace=`stable==done`]]"></use>
            `:else=`
            <use xlink:href="[[~[[*id]]? &scheme=`full`]]#status-[[+status_progress]]"></use>
            `]]
        </svg>
        <span class="hidden priority">
            [[+status_priority_[[+idx]]]]
        </span>
    </td>
    <td class="selectable">
        <a class="edit" href="[[getContextSetting? &context=`web` &setting=`site_url`]]manager/?a=resource/update&id=[[+id]]" target="_blank">[[+id]]</a>
    </td>
    <td class="selectable metadata">
        <a class="level-[[+level]]" href="[[~[[+id]]]]" target="_blank">[[+pagetitle]]</a>
        <a class="ui empty floating [[+description:eq=``:then=`red`:else=`green`]] circular label with tooltip onclick" title="Description" data-title="Description" data-content="[[+description:empty=`This field is still empty.`]]" data-variation="basic"></a>
        <a class="ui empty floating [[+longtitle:eq=``:then=`red`:else=`green`]] circular label with tooltip onclick" title="Longtitle" data-title="Longtitle" data-content="[[+longtitle:empty=`This field is still empty.`]]" data-variation="basic"></a>
    </td>
    <td class="ui blue labels">
        [[+status_tasks_[[+idx]]]]
    </td>
    [[+status_indexation_[[+idx]]:notempty=`
    <td class="indexation">
        [[+status_indexation_[[+idx]]:contains=`noindex`:or:contains=`nofollow`:then=`<i class="attention icon"></i>`]]
        [[+status_indexation_[[+idx]]]]
    </td>
    `]]
    <td class="owner">
        [[+content_owner:userinfo=`username`]]
    </td>
    <td class="due date">
        <span class="hidden sort">[[+planning_date_due]]</span>
        [[+planning_date_due:strtotime:date=`[[++romanesco.date_format_long]]`]]
    </td>
</tr>
[[+wrapper]]