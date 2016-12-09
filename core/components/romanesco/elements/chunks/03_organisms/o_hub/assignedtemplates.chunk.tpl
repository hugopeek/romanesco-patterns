<div class="ui list">
    [[[[If?
        &subject=`[[+pattern_name]]`
        &operator=`notempty`
        &then=`
            Rowboat?
                &table=`modx_site_tmplvar_templates`
                &tpl=`assignedTemplatesRow`
                &where=`{ "tmplvarid":"[[getTmplvarID? &tv=`[[+pattern_name:empty=``]]`]]" }`
            `
    ]]]]
</div>