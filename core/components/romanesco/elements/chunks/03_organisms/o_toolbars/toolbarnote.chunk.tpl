[[modifiedIf?
    &subject=`[[*toolbar_visibility]]`
    &operator=`EQ`
    &operand=`default`
    &then=`[[++toolbar_visibility_default]]`
    &else=`[[*toolbar_visibility]]`
    &toPlaceholder=`toolbar_visibility`
]]

[[+toolbar_visibility:eq=`1`:then=`
<div id="toolbar" class="ui large attached menu">
    <div class="item mobile hidden">
        [[$breadcrumbs? &alias_visibility=`1`]]
    </div>
    <div class="right menu">
        <div class="search item">
            [[SimpleSearchForm?
                &tpl=`searchField`
                &landing=`[[++romanesco.search_result_id]]`
            ]]
        </div>
        [[!Login?
            &tplType=`modChunk`
            &loginTpl=`loginFormCompact`
            &logoutTpl=`logoutFormCompact`
            &form_size=`small`
            &form_layout=`vertical`
        ]]
    </div>
</div>
`]]