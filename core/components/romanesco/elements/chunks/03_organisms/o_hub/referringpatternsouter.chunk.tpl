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
                &where=`{ "tmplvarid":"[[+tmplvarid]]" }`
            `
    ]]]]
    [[[[If?
        &subject=`referringChunks`
        &operator=`inarray`
        &operand=`[[+pattern_list]]`
        &then=`
            Rowboat?
                &table=`modx_site_htmlsnippets`
                &tpl=`includedPatternsRow`
                &sortBy=`name`
                &where=`{ "snippet:LIKE":"%[[+pattern_name]]%" }`
            `
    ]]]]
    [[[[If?
        &subject=`referringSnippets`
        &operator=`inarray`
        &operand=`[[+pattern_list]]`
        &then=`
            Rowboat?
                &table=`modx_site_snippets`
                &tpl=`includedPatternsRow`
                &sortBy=`name`
                &where=`{ "snippet:LIKE":"%[[+pattern_name]]%" }`
            `
    ]]]]
    [[[[If?
        &subject=`referringTemplates`
        &operator=`inarray`
        &operand=`[[+pattern_list]]`
        &then=`
            Rowboat?
                &table=`modx_site_templates`
                &tpl=`includedPatternsRow`
                &sortBy=`templatename`
                &where=`{ "content:LIKE":"%[[+pattern_name]]%" }`
            `
    ]]]]
    [[[[If?
        &subject=`referringTVs`
        &operator=`inarray`
        &operand=`[[+pattern_list]]`
        &then=`
            Rowboat?
                &table=`modx_site_tmplvars`
                &tpl=`includedPatternsRow`
                &sortBy=`name`
                &where=`{ "elements:LIKE":"%[[+pattern_name]]%" }`
            `
    ]]]]
</div>