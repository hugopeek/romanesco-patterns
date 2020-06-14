[[$cbLayoutStatusPattern:filterLine=`[[+pattern_status]]`:stripString=`=[[+pattern_status]]`:toPlaceholder=`status_title`]]

<div class="ui middle aligned equal width stackable grid">
    <div class="column">
        [[$headingBasicAnchor?
            &level=`h3`
            &value=`[[+pattern_name]]<span class="ui mini [[+pattern_status]] empty circular label" title="[[+status_title]]"></span>`
            &alignment=`middle aligned`
        ]]
    </div>

    <div class="seven wide right aligned column">
        <i class="unhide link icon with visibility toggle and tooltip"
           data-target="#preview-[[+unique_idx]]"
           data-targetState="visible"
           data-content="[[%romanesco.patterns.preview_tooltip]]"
           data-position="top center"></i>
        <i class="muted code link icon with visibility toggle and tooltip"
           data-target="#code-[[+unique_idx]]"
           data-targetState="hidden"
           data-content="[[%romanesco.patterns.code_tooltip]]"
           data-position="top center"></i>
        <i class="muted comment link icon with tooltip"
           data-content="[[%romanesco.patterns.comment_tooltip]]"
           data-position="top center"></i>

        [[[[If?
            &subject=`[[+pattern_template]]`
            &operator=`EQ`
            &operand=`patternLayoutBosonField`
            &then=`
                pdoMenu?
                    &parents=`[[++romanesco.backyard_container_id]]`
                    &showHidden=`1`
                    &showUnpublished=`1`
                    &includeTVs=`overview_icon_font`
                    &tplOuter=`navWrapper`
                    &tpl=`navItemIcon`
                    &where=`{ "properties:LIKE":"%field__:[[+[[+cf]].id]]___settings%" }`
                    &toPlaceholder=`backyard_pages`
                `
            &else=`
                pdoMenu?
                    &parents=`[[++romanesco.backyard_container_id]]`
                    &showHidden=`1`
                    &showUnpublished=`1`
                    &includeTVs=`overview_icon_font`
                    &tplOuter=`navWrapper`
                    &tpl=`navItemIcon`
                    &where=`{ "content:LIKE":"%[[+pattern_name]]%" }`
                    &toPlaceholder=`backyard_pages`
                `
        ]]]]

        <div class="ui [[+backyard_pages:is=``:then=`disabled`]] small floating right labeled icon top right pointing primary dropdown button">
            Backyard
            <i class="lab icon"></i>
            <div class="menu">
                <div class="header">
                    View in context:
                </div>
                <div class="divider"></div>
                [[+backyard_pages]]
            </div>
        </div>
    </div>
</div>

[[$dividerBasic]]