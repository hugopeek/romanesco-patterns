[[[[If?
    &subject=`[[+pattern_template]]`
    &operator=`inarray`
    &operand=`patternLayoutAtom,patternLayoutMolecule,patternLayoutOrganism`
    &then=`
        Rowboat:toPlaceholder=`raw_element`?
            &table=`modx_site_htmlsnippets`
            &tpl=`displayRawElement`
            &where=`{"name":"[[+pattern_name]]"}`
        `
]]]]

[[[[If?
    &subject=`[[+pattern_template]]`
    &operator=`EQ`
    &operand=`patternLayoutTemplate`
    &then=`
        Rowboat:toPlaceholder=`raw_element`?
            &table=`modx_site_templates`
            &tpl=`displayRawTemplate`
            &where=`{"templatename":"[[+pattern_name]]"}`
        `
]]]]

[[[[If?
    &subject=`[[+pattern_template]]`
    &operator=`EQ`
    &operand=`patternLayoutFormula`
    &then=`
        Rowboat:toPlaceholder=`raw_element`?
            &table=`modx_site_snippets`
            &tpl=`displayRawElement`
            &where=`{"name":"[[+pattern_name]]"}`
        `
]]]]

[[[[If?
    &subject=`[[+pattern_template]]`
    &operator=`EQ`
    &operand=`patternLayoutComputation`
    &then=`
        Rowboat:toPlaceholder=`raw_element`?
            &table=`modx_site_plugins`
            &tpl=`displayRawPlugin`
            &where=`{"name":"[[+pattern_name]]"}`
        `
]]]]

[[[[If?
    &subject=`[[+pattern_template]]`
    &operator=`EQ`
    &operand=`patternLayoutBoson`
    &then=`
        Rowboat:toPlaceholder=`raw_element`?
            &table=`modx_contentblocks_field`
            &tpl=`displayRawContentBlock`
            &where=`{"name":"[[+pattern_name]]"}`
        `
]]]]

<div class="ui list">
    [[If?
        &subject=`assignedTVs`
        &operator=`inarray`
        &operand=`[[+pattern_list]]`
        &then=`[[assignedTVs? &template=`[[+pattern_name:empty=``]]`]]`
        &else=`
            [[If?
                &subject=`[[+pattern_template]]`
                &operator=`inarray`
                &operand=`patternLayoutAtom,patternLayoutMolecule,patternLayoutOrganism,patternLayoutTemplate`
                &then=`
                    [[includedTVs? &input=`[[+raw_element]]`]]
                    [[includedChunks? &input=`[[+raw_element]]`]]
                    [[includedSnippets? &input=`[[+raw_element]]`]]
                `
            ]]
        `
    ]]
</div>