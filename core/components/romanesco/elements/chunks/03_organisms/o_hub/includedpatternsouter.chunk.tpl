[[[[If?
    &subject=`[[+pattern_template]]`
    &operator=`inarray`
    &operand=`patternLayoutAtom,patternLayoutMolecule,patternLayoutOrganism`
    &then=`
        Rowboat?
            &table=`modx_site_htmlsnippets`
            &tpl=`displayRawElement`
            &where=`{"name":"[[+pattern_name]]"}`
            &toPlaceholder=`[[+prefix]].raw_element`
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
            &toPlaceholder=`[[+prefix]].raw_element`
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
            &toPlaceholder=`[[+prefix]].raw_element`
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
            &toPlaceholder=`[[+prefix]].raw_element`
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
            &where=`{"id":"[[+pattern_id]]","parent":"0"}`
            &toPlaceholder=`[[+prefix]].raw_element`
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
            &where=`{"id":"[[+pattern_id]]"}`
            &toPlaceholder=`[[+prefix]].raw_element`
        `
]]]]

<div class="ui list">
    [[[[If?
        &subject=`assignedTVs`
        &operator=`inarray`
        &operand=`[[+pattern_list]]`
        &then=`assignedTVs:toPlaceholder=`[[+prefix]].tv_list`? &template=`[[+pattern_name:empty=``]]``
    ]]]]

    [[If:empty=`<div class="muted item"><em>[[%romanesco.patterns.not_found]]</em></div>`?
        &subject=`assignedTVs`
        &operator=`inarray`
        &operand=`[[+pattern_list]]`
        &then=`[[+[[+prefix]].tv_list]]`
        &else=`
            [[includedTVs? &input=`[[+[[+prefix]].raw_element]]`]]
            [[includedChunks? &input=`[[+[[+prefix]].raw_element]]` &name=`[[+pattern_name]]` &id=`[[+pattern_id]]` &type=`[[+pattern_template]]`]]
            [[includedSnippets? &input=`[[+[[+prefix]].raw_element]]`]]
        `
    ]]
</div>