[[!TaggerGetTags:contains=`[[+tag]]`:then=`active`:toPlaceholder=`active_state`?
    &groups=`2`
    &resources=`[[*id]]`
    &target=`[[*parent]]`
    &rowTpl=`tagItemRaw`
]]
<a class="ui [[+active_state]] label" href="[[+uri]]">
    [[+tag]]
    <span class="detail">[[+cnt]]</span>
</a>