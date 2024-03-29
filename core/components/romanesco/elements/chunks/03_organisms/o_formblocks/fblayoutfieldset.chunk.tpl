[[modifiedIf?
    &subject=`[[+layout_title]]`
    &operator=`notempty`
    &then=`id="fb[[*id]]-[[stripAsAlias? &input=`[[+layout_title]]`]]"`
    &toPlaceholder=`fieldset_id_[[+unique_idx]]`
]]
[[modifiedIf?
    &subject=`[[+segment_type]]`
    &operator=`isnot`
    &operand=`none`
    &then=`segment`
    &else=`[[*fb_form_layout:isnot=`inline`:then=`fieldset`]]`
    &toPlaceholder=`segment_parent`
]]
[[+force_segment:eq=`1`:then=`segment`:else=`[[+segment_parent]]`:toPlaceholder=`segment`]]

<fieldset [[+fieldset_id_[[+unique_idx]]]] class="ui [[+padding]] [[+segment]] [[+background:setBackground]]">
    [[+legend:notempty=`<legend class="ui [[+form_size]] header">[[+legend]]</legend>`]]
    [[*fb_form_layout:is=`inline`:then=`<span class="equal width fields">`]]
    [[+main]]
    [[*fb_form_layout:is=`inline`:then=`</span>`]]
</fieldset>