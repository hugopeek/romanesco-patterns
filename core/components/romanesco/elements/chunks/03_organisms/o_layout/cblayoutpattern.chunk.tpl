<div class="ui vertical stripe pattern segment [[+background:setBackground]]">
    <div class="ui [[+container_type]] [[+alignment]] container">
        [[[[If?
            &subject=`[[+pattern_template]]`
            &operator=`EQ`
            &operand=`patternLayoutBosonField`
            &then=`setPatternPlaceholders? &cbField=`[[+pattern_name]]` &prefix=`cf_[[+idx]]_[[+unique_idx]]``
        ]]]]
        [[[[If?
            &subject=`[[+pattern_template]]`
            &operator=`EQ`
            &operand=`patternLayoutBosonLayout`
            &then=`setPatternPlaceholders? &cbLayout=`[[+pattern_name]]` &prefix=`cl_[[+idx]]_[[+unique_idx]]``
        ]]]]

        [[!$cbLayoutPatternPreview:toPlaceholder=`preview_[[+idx]]_[[+unique_idx]]`?
            &preview=`[[+preview]]`
            &code=`[[+code]]`
            &sidebar_width=`[[+sidebar_width]]`
            &pattern_name=`[[+pattern_name]]`
            &pattern_template=`[[+pattern_template]]`
            &raw_tags=`[[+raw_tags]]`
            &rendered_tags=`[[+rendered_tags]]`
            &idx=`[[+idx]]`
            &unique_idx=`[[+unique_idx]]`
        ]]

        [[[[modifiedIf?
            &subject=`[[+pattern_template]]`
            &operator=`contains`
            &operand=`Electron`
            &then=`
                $toolbarPatternElectron?
                    &pattern_name=`[[+pattern_name]]`
                    &pattern_status=`[[+pattern_status]]`
                `
            &else=`
                $toolbarPattern?
                    &pattern_name=`[[+pattern_name]]`
                    &pattern_template=`[[+pattern_template]]`
                    &pattern_status=`[[+pattern_status]]`
                    &idx=`[[+idx]]`
                    &unique_idx=`[[+unique_idx]]`
                `
        ]]]]

        [[[[modifiedIf?
            &subject=`[[+pattern_template]]`
            &operator=`containsnot`
            &operand=`Electron`
            &then=`+preview_[[+idx]]_[[+unique_idx]]`
        ]]]]

        [[+info]]
    </div>
</div>