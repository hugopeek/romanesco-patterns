<div class="ui middle aligned equal width grid">
    <div class="column">
        [[$headingBasic?
            &level=`h3`
            &value=`[[+pattern_name]]<span class="ui mini [[%romanesco.patterns.status_[[+pattern_status]]_color]] empty circular label" title="[[%romanesco.patterns.status_[[+pattern_status]]]]"></span>`
            &alignment=`middle aligned`
        ]]
    </div>

    <div class="compact column">
        <i class="unhide link icon with visibility toggle and tooltip"
           data-target="#preview-[[+pattern_name:lcase]]"
           data-targetState="visible"
           data-content="[[%romanesco.patterns.preview_tooltip]]"
           data-position="top center"></i>
        <i class="muted code link icon with visibility toggle and tooltip"
           data-target="#code-[[+pattern_name:lcase]]"
           data-targetState="hidden"
           data-content="[[%romanesco.patterns.code_tooltip]]"
           data-position="top center"></i>
        <i class="muted random link icon with tooltip"
           data-content="[[%romanesco.patterns.connections_tooltip]]"
           data-position="top center"></i>
    </div>
</div>

[[$dividerBasic]]