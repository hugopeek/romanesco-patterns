[[modifiedIf?
    &subject=`[[*toolbar_visibility]]`
    &operator=`EQ`
    &operand=`default`
    &then=`[[++toolbar_visibility_default]]`
    &else=`[[*toolbar_visibility]]`
    &toPlaceholder=`toolbar_visibility`
]]

[[+toolbar_visibility:eq=`1`:then=`
<div id="toolbar" class="ui vertical secondary segment">
    <div class="ui container">
        <div class="ui stackable relaxed grid">
            <div class="ten wide tablet ten wide computer twelve wide large screen stretched middle aligned column">
                [[$breadcrumbs]]
            </div>
            <div class="six wide tablet six wide computer four wide large screen column">
                [[SimpleSearchForm?
                    &tpl=`searchField`
                    &landing=`[[++romanesco.search_result_id]]`
                ]]
            </div>
        </div>
    </div>
</div>
`]]