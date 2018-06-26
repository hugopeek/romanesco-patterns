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
            <div class="sixteen wide mobile nine wide computer ten wide large screen middle aligned column">
                [[$breadcrumbs]]
            </div>
            <div class="sixteen wide mobile seven wide computer six wide large screen column">
                <div class="ui equal width grid">
                    <div class="column">
                        [[SimpleSearchForm?
                            &tpl=`searchField`
                            &landing=`[[++romanesco.search_result_id]]`
                        ]]
                    </div>
                    <div class="compact column">
                        [[!Login?
                            &tplType=`modChunk`
                            &loginTpl=`loginFormCompact`
                            &logoutTpl=`logoutFormCompact`
                            &form_size=`small`
                            &form_layout=`vertical`
                        ]]
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
`]]