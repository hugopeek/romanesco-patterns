[[If?
    &subject=`[[+layout_title]]`
    &operator=`notempty`
    &then=`id="fb[[*id]]-[[stripAsAlias? &input=`[[+layout_title]]`]]"`
    &toPlaceholder=`fieldset_[[*id]]_[[+unique_idx]]`
]]
[[If?
    &subject=`[[+segment_type]]`
    &operator=`isnot`
    &operand=`none`
    &then=`segment`
    &else=`[[*fb_form_layout:isnot=`inline`:then=`fieldset`]]`
    &toPlaceholder=`segment_[[*id]]_[[+unique_idx]]_parent`
]]
[[If?
    &subject=`[[+force_segment]]`
    &operator=`eq`
    &operand=`1`
    &then=`segment`
    &else=`[[+segment_[[*id]]_[[+unique_idx]]_parent]]`
    &toPlaceholder=`segment_[[*id]]_[[+unique_idx]]`
]]
<fieldset [[+fieldset_[[*id]]_[[+unique_idx]]]] class="ui [[+padding]] [[+segment_[[*id]]_[[+unique_idx]]]] [[+background:setBackground]]">
    [[+legend:notempty=`<legend class="ui [[+form_size]] header">[[+legend]]</legend>`]]
    [[*fb_form_layout:is=`inline`:then=`<span class="equal width fields">`]]
    [[+main]]
    [[*fb_form_layout:is=`inline`:then=`</span>`]]
</fieldset>