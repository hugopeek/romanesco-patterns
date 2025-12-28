[[+segment_type:notempty=`
<div class="ui [[+padding]] [[+alignment]] [[+segment_type]] [[+background:setBackground]] text segment">
    [[+content]]
</div>
`:empty=`
    [[+content]]
`]]

[[[[If?
    &subject=`[[+content]]`
    &operator=`contains`
    &operand=`</table>`
    &then=`loadAssets? &component=`table``
]]]]