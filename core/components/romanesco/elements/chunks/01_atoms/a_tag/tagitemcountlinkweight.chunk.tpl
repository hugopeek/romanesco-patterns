[[TaggerGetTags:contains=`[[+tag]]`:then=`active`:toPlaceholder=`active_state`?
    &groups=`[[*tag_groups]]`
    &resources=`[[*id]]`
    &target=`[[*parent]]`
    &rowTpl=`rawTag`
]]
<a class="ui [[+active_state]] [[+cnt:calculateWeight]] label" href="[[+uri]]">
    [[+tag]]
</a>