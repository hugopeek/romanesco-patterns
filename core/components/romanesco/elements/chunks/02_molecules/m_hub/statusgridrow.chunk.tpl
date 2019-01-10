[[Switch:toPlaceholder=`status_priority_[[+idx]]`?
    &get=`[[+status_progress]]`
    &c1=`to-do` &do1=`4`
    &c2=`in-progress` &do2=`2`
    &c3=`review` &do3=`1`
    &c4=`done` &do4=`5`
    &c5=`successful` &do5=`6`
    &c6=`problematic` &do6=`3`
    &c7=`expired` &do7=`7`
    &default=`0`
]]

[[migxLoopCollection?
    &packageName=`romanescobackyard`
    &classname=`rmNoteImprovement`
    &where=`{"resource_id":"[[+id]]"}`
    &tpl=`tagItemTooltip`
    &toPlaceholder=`status_improvements_[[+idx]]`
]]
[[migxLoopCollection?
    &packageName=`romanescobackyard`
    &classname=`rmNoteIssue`
    &where=`{"resource_id":"[[+id]]"}`
    &tpl=`tagItemTooltip`
    &toPlaceholder=`status_issues_[[+idx]]`
]]

<tr class="[[+status_priority_[[+idx]]:gte=`5`:and:lte=`6`:then=`positive`]][[+status_priority_[[+idx]]:eq=`3`:or:eq=`7`:then=`negative`]][[+status_priority_[[+idx]]:eq=`1`:then=`warning`]][[+published:eq=`0`:then=` disabled`]]">
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
        [[+status_improvements_[[+idx]]]]
    </td>
    <td class="ui red labels [[+status_issues_[[+idx]]:notempty=`negative`]]">
        [[+status_issues_[[+idx]]]]
    </td>
    <td class="[[!+modx.user.username:eq=`[[+content_owner:userinfo=`username`]]`:then=`info`:else=``]]">
        [[+content_owner:userinfo=`username`]]
    </td>
    <td class="">
        <span class="hidden sort element">
            [[+planning_date_completed]]
        </span>
        [[+planning_date_completed:strtotime:date=`[[++romanesco.date_format_long]]`]]
    </td>
</tr>
[[+wrapper]]