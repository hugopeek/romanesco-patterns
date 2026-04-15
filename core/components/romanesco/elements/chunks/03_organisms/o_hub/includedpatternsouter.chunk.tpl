[[[[If?
    &subject=`[[+pattern_template]]`
    &operator=`inarray`
    &operand=`patternLayoutAtom,patternLayoutMolecule,patternLayoutOrganism`
    &then=`
        migxLoopCollection?
            &classname=`MODX\Revolution\modChunk`
            &tpl=`displayRawElement`
            &where=`{"name":"[[+pattern_name]]"}`
            &toPlaceholder=`[[+prefix]].raw_element`
        `
]]]]

[[[[If?
    &subject=`[[+pattern_template]]`
    &operator=`eq`
    &operand=`patternLayoutTemplate`
    &then=`
        migxLoopCollection?
            &classname=`MODX\Revolution\modTemplate`
            &tpl=`displayRawTemplate`
            &where=`{"templatename":"[[+pattern_name]]"}`
            &toPlaceholder=`[[+prefix]].raw_element`
        `
]]]]

[[[[If?
    &subject=`[[+pattern_template]]`
    &operator=`eq`
    &operand=`patternLayoutFormula`
    &then=`
        migxLoopCollection?
            &classname=`MODX\Revolution\modSnippet`
            &tpl=`displayRawElement`
            &where=`{"name":"[[+pattern_name]]"}`
            &toPlaceholder=`[[+prefix]].raw_element`
        `
]]]]

[[[[If?
    &subject=`[[+pattern_template]]`
    &operator=`eq`
    &operand=`patternLayoutComputation`
    &then=`
        migxLoopCollection?
            &classname=`MODX\Revolution\modPlugin`
            &tpl=`displayRawPlugin`
            &where=`{"name":"[[+pattern_name]]"}`
            &toPlaceholder=`[[+prefix]].raw_element`
        `
]]]]

[[[[If?
    &subject=`[[+pattern_template]]`
    &operator=`eq`
    &operand=`patternLayoutBosonField`
    &then=`
        migxLoopCollection?
            &packageName=`contentblocks`
            &classname=`cbField`
            &tpl=`displayRawContentBlock`
            &where=`{"id":"[[+pattern_id]]","parent":"0"}`
            &toPlaceholder=`[[+prefix]].raw_element`
        `
]]]]

[[[[If?
    &subject=`[[+pattern_template]]`
    &operator=`eq`
    &operand=`patternLayoutBosonLayout`
    &then=`
        migxLoopCollection?
            &packageName=`contentblocks`
            &classname=`cbLayout`
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