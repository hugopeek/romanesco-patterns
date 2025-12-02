<div class="ui middle aligned equal width toolbar grid">
    <div class="column">
        [[$headingBasic?
            &level=`h3`
            &value=`[[+pattern_name]]<span class="ui mini [[%romanesco.patterns.status_[[+pattern_status]]_color]] empty circular label" title="[[%romanesco.patterns.status_[[+pattern_status]]]]"></span>`
            &alignment=`middle aligned`
        ]]
    </div>

    <div class="compact column">
        [[+elementType:isnot=`ElectronTV`:and:isnot=`Computation`:then=`
        <i class="unhide link icon with visibility toggle and tooltip"
           data-target="#preview-[[+pattern_name:lcase]]"
           data-targetState="visible"
           data-content="[[%romanesco.patterns.preview_tooltip]]"
           data-position="top center"></i>
        `]]
        <i class="muted code link icon with visibility toggle and tooltip"
           data-target="#code-[[+pattern_name:lcase]]"
           data-targetState="hidden"
           data-content="[[%romanesco.patterns.code_tooltip]]"
           data-position="top center"></i>
        <i class="muted random link icon with visibility toggle and tooltip"
           data-target="#connections-[[+pattern_name:lcase]]"
           data-targetState="hidden"
           data-content="[[%romanesco.patterns.connections_tooltip]]"
           data-position="top center"></i>
        [[+elementType:containsnot=`Electron`:then=`
        <a class="ui large compact basic icon button with tooltip"
           href="[[++site_url:stripString=`hub.`]]manager/?a=element/[[+element_class:lcase:stripString=`mod`]]/update&id=[[+id]]"
           data-content="[[%romanesco.patterns.edit_tooltip]]"
           data-position="top center"
           target="_blank">
            <i class="modx icon"></i>
        </a>
        `]]
    </div>
</div>
