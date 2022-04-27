[[!TaggerGetTags:contains=`[[+tag]]`:then=`active`:toPlaceholder=`active_state`?
    &groups=`2`
    &resources=`[[*id]]`
    &target=`[[*parent]]`
    &rowTpl=`rawTag`
]]
<a class="ui [[+active_state]] label" href="[[+uri]]">
    [[+tag]]
    <span class="detail">[[+cnt]]</span>
</a>