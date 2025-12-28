[[If?
    &subject=`[[+segment_type]]`
    &operator=`notempty`
    &then=`
    <div class="ui [[+padding]] [[+alignment]] [[+segment_type]] [[+background:setBackground]] text segment">
        [[+content]]
    </div>
    `
    &else=`[[+content]]`
]]

[[[[If?
    &subject=`[[+content]]`
    &operator=`contains`
    &operand=`</table>`
    &then=`loadAssets? &component=`table``
]]]]