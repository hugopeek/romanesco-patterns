[[modifiedIf?
    &subject=`[[+segment_type]]`
    &operator=`isnot`
    &operand=`none`
    &then=`segment`
    &else=`[[*fb_form_layout:isnot=`inline`:then=`fieldset`]]`
    &toPlaceholder=`segment_parent`
]]
[[+force_segment:eq=`1`:then=`segment`:else=`[[+segment_parent]]`:toPlaceholder=`segment`]]

<fieldset [[+title:notempty=`id="fb[[*id]]-[[stripAsAlias? &input=`[[+title]]`]]"`]] class="ui [[+padding]] [[+segment]] [[+background:setBackground]]">
    [[+legend:notempty=`<legend class="ui [[+form_size]] header">[[+legend]]</legend>`]]
    [[*fb_form_layout:is=`inline`:then=`<span class="equal width fields">`]]
    [[+main]]
    [[*fb_form_layout:is=`inline`:then=`</span>`]]
</fieldset>