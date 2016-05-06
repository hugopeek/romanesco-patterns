<tr [[+status_indicator:eq=`done`:then=`class="positive"`]]>
    <td class="indicator">
        [[Switch?
            &get=`[[+status_indicator]]`
            &c1=`done` &do1=`<i class="large green checkmark icon"></i><span class="hidden">1</span>`
            &c2=`almost-done` &do2=`<i class="large orange wait icon"></i><span class="hidden">3</span>`
            &c3=`not-done` &do3=`<i class="large red remove circle outline icon"></i><span class="hidden">4</span>`
            &c4=`expired` &do4=`<i class="large yellow history icon"></i><span class="hidden">2</span>`
            &default=`<i class="large help icon"></i>`
        ]]
    </td>
    <td class="[[+published:eq=`1`:then=`active`]]">[[+id]]</td>
    <td class="selectable"><a class="level-[[+level]]" href="[[~[[+id]]]]">[[+pagetitle]]</a></td>
    <td class="ui blue labels">[[+status_improvements:parseTags]]</td>
    <td class="[[!+modx.user.username:eq=`[[+status_assigned_user]]`:then=`warning`:else=``]]">[[+status_assigned_user]]</td>
    <td class="ui red labels [[+status_help:notempty=`negative`]]">[[+status_help:parseTags]]</td>
    [[!getImageList:empty=`<td></td>`?
        &docid=`[[+id]]`
        &tvname=`status_notes`
        &tpl=`statusGridColumnNotes`
        &limit=`1`
    ]]
</tr>
[[+wrapper]]