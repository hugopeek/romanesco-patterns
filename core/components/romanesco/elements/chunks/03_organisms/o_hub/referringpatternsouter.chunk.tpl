<div class="ui list">
    [[[[If?
        &subject=`assignedTemplates`
        &operator=`inarray`
        &operand=`[[+pattern_list]]`
        &then=`getTmplvarID:toPlaceholder=`tmplvarid`? &tv=`[[+pattern_name:empty=``]]``
    ]]]]
    [[[[If?
        &subject=`assignedTemplates`
        &operator=`inarray`
        &operand=`[[+pattern_list]]`
        &then=`
            Rowboat?
                &table=`modx_site_tmplvar_templates`
                &tpl=`assignedTemplatesRow`
                &limit=`0`
                &where=`{ "tmplvarid":"[[+tmplvarid]]" }`
            `
    ]]]]
    [[[[If?
        &subject=`[[+pattern_template]]`
        &operator=`inarray`
        &operand=`patternLayoutAtom,patternLayoutMolecule,patternLayoutOrganism`
        &then=`
            Rowboat?
                &table=`modx_site_tmplvars`
                &tpl=`includedPatternsRow`
                &sortBy=`name`
                &limit=`0`
                &where=`{ "elements:LIKE":"%[[+pattern_name]]%" }`
            `
    ]]]]
    [[[[If?
        &subject=`[[+pattern_template]]`
        &operator=`inarray`
        &operand=`patternLayoutElectronTV,patternLayoutElectronSystemSetting,patternLayoutElectronConfiguration,patternLayoutAtom,patternLayoutMolecule,patternLayoutOrganism,patternLayoutFormula`
        &then=`
            Rowboat?
                &table=`modx_site_htmlsnippets`
                &tpl=`includedPatternsRow`
                &sortBy=`name`
                &limit=`0`
                &where=`{ "snippet:LIKE":"%[[+pattern_name]]%" }`
            `
    ]]]]
    [[[[If?
        &subject=`[[+pattern_template]]`
        &operator=`inarray`
        &operand=`patternLayoutElectronTV,patternLayoutElectronSystemSetting,patternLayoutAtom,patternLayoutMolecule,patternLayoutOrganism,patternLayoutFormula`
        &then=`
            Rowboat?
                &table=`modx_site_snippets`
                &tpl=`includedPatternsRow`
                &sortBy=`name`
                &limit=`0`
                &where=`{ "snippet:LIKE":"%[[+pattern_name]]%" }`
            `
    ]]]]
    [[[[If?
        &subject=`[[+pattern_template]]`
        &operator=`inarray`
        &operand=`patternLayoutElectronTV,patternLayoutElectronSystemSetting,patternLayoutElectronConfiguration,patternLayoutAtom,patternLayoutMolecule,patternLayoutOrganism,patternLayoutFormula`
        &then=`
            Rowboat?
                &table=`modx_site_templates`
                &tpl=`includedPatternsRow`
                &sortBy=`templatename`
                &limit=`0`
                &where=`{ "content:LIKE":"%[[+pattern_name]]%" }`
            `
    ]]]]
    [[[[If?
        &subject=`[[+pattern_template]]`
        &operator=`inarray`
        &operand=`patternLayoutTemplate`
        &then=`
            Rowboat?
                &table=`modx_site_content`
                &tpl=`includedPagesRow`
                &limit=`0`
                &where=`{ "content:LIKE":"%[[+pattern_name]]%" }`
            `
    ]]]]
    [[[[If?
        &subject=`[[+pattern_template]]`
        &operator=`inarray`
        &operand=`patternLayoutBosonField,patternLayoutBosonLayout,patternLayoutOrganism,patternLayoutBosonTemplate`
        &then=`
            Rowboat?
                &table=`modx_site_content`
                &tpl=`includedPagesRow`
                &limit=`0`
                &where=`{ "properties:LIKE":"%\"field\":[[+[[+prefix]].id]],%" }`
            `
    ]]]]
    [[[[If?
        &subject=`[[+pattern_template]]`
        &operator=`inarray`
        &operand=`patternLayoutElectronTV,patternLayoutElectronSystemSetting,patternLayoutElectronConfiguration,patternLayoutAtom,patternLayoutMolecule,patternLayoutOrganism,patternLayoutFormula`
        &then=`referringBosons? &pattern=`[[+pattern_name:empty=``]]``
    ]]]]
</div>