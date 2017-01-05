[[[[If?
    &subject=`[[+pattern_template]]`
    &operator=`inarray`
    &operand=`patternLayoutAtom,patternLayoutMolecule,patternLayoutOrganism`
    &then=`
        Rowboat?
            &table=`modx_site_htmlsnippets`
            &tpl=`displayRawElement`
            &where=`{"name":"[[+pattern_name]]"}`
            &toPlaceholder=`raw_element`
        `
]]]]

[[[[If?
    &subject=`[[+pattern_template]]`
    &operator=`EQ`
    &operand=`patternLayoutTemplate`
    &then=`
        Rowboat?
            &table=`modx_site_templates`
            &tpl=`displayRawTemplate`
            &where=`{"templatename":"[[+pattern_name]]"}`
            &toPlaceholder=`raw_element`
        `
]]]]

[[[[If?
    &subject=`[[+pattern_template]]`
    &operator=`EQ`
    &operand=`patternLayoutFormula`
    &then=`
        Rowboat?
            &table=`modx_site_snippets`
            &tpl=`displayRawElement`
            &where=`{"name":"[[+pattern_name]]"}`
            &toPlaceholder=`raw_element`
        `
]]]]

[[[[If?
    &subject=`[[+pattern_template]]`
    &operator=`EQ`
    &operand=`patternLayoutComputation`
    &then=`
        Rowboat?
            &table=`modx_site_plugins`
            &tpl=`displayRawPlugin`
            &where=`{"name":"[[+pattern_name]]"}`
            &toPlaceholder=`raw_element`
        `
]]]]

[[[[If?
    &subject=`[[+pattern_template]]`
    &operator=`EQ`
    &operand=`patternLayoutBosonField`
    &then=`
        Rowboat?
            &table=`modx_contentblocks_field`
            &tpl=`displayRawContentBlock`
            &where=`{"name":"[[+pattern_name]]"}`
            &toPlaceholder=`raw_element`
        `
]]]]

[[[[If?
    &subject=`[[+pattern_template]]`
    &operator=`EQ`
    &operand=`patternLayoutBosonLayout`
    &then=`
        Rowboat?
            &table=`modx_contentblocks_layout`
            &tpl=`displayRawContentBlock`
            &where=`{"name":"[[+pattern_name]]"}`
            &toPlaceholder=`raw_element`
        `
]]]]

<div class="ui list">
    [[[[If?
        &subject=`assignedTVs`
        &operator=`inarray`
        &operand=`[[+pattern_list]]`
        &then=`assignedTVs:toPlaceholder=`tv_list`? &template=`[[+pattern_name:empty=``]]``
    ]]]]
    [[If?
        &subject=`[[+tv_list]]`
        &operator=`empty`
        &then=`
            [[includedTVs? &input=`[[+raw_element]]`]]
            [[includedChunks? &input=`[[+raw_element]]`]]
            [[includedSnippets? &input=`[[+raw_element]]`]]
        `
        &else=`[[+tv_list]]`
    ]]
</div>