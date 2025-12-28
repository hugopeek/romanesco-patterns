<div id="markdown" class="ui vertical stripe segment [[setBackground? &background=`[[+background:empty=`[[++layout_background_default]]`]]`]]">
    <div class="ui [[+container_type]] [[+alignment]] container">
        [[$contentMarkdown]]
    </div>
</div>
[[[[If?
    &subject=`[[$contentMarkdown]]`
    &operator=`contains`
    &operand=`</table>`
    &then=`loadAssets? &component=`table``
]]]]