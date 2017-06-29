[[Switch:toPlaceholder=`status_priority_[[+idx]]`?
    &get=`[[+status_indicator]]`
    &c1=`not-done` &do1=`4`
    &c2=`in-progress` &do2=`2`
    &c3=`almost-done` &do3=`1`
    &c4=`done` &do4=`5`
    &c5=`successful` &do5=`6`
    &c6=`problematic` &do6=`3`
    &c7=`expired` &do7=`7`
    &default=`0`
]]

<tr class="[[+status_priority_[[+idx]]:gte=`5`:and:lte=`6`:then=`positive`]][[+status_priority_[[+idx]]:eq=`3`:or:eq=`7`:then=`negative`]][[+status_priority_[[+idx]]:eq=`1`:then=`warning`]][[+published:eq=`0`:then=` disabled`]]">
    <td class="indicator">
        <svg class="icon" viewBox="0 0 100 100">
            <use xlink:href="[[~[[*id]]? &scheme=`full`]]#status-[[+status_indicator]]"></use>
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
        [[+status_improvements:parseTags]]
    </td>
    <td class="[[!+modx.user.username:eq=`[[+status_assigned_user]]`:then=`warning`:else=``]]">
        [[+status_assigned_user]]
    </td>
    <td class="ui red labels [[+status_help:notempty=`negative`]]">
        [[+status_help:parseTags]]
    </td>
    [[!getImageList:empty=`<td></td>`?
        &docid=`[[+id]]`
        &tvname=`status_notes`
        &tpl=`statusGridColumnNotes`
        &limit=`1`
    ]]
</tr>
[[+wrapper]]