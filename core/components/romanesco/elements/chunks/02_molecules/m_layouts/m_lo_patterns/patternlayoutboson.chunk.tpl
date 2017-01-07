[[-setPatternPlaceholders? &cbField=`[[+pattern_name]]` &prefix=`pl_[[+layout_id]]_[[+layout_idx]]`]]

<div class="ui two column middle aligned equal width grid">
    <div class="column">
        [[$headingBasicAnchor?
            &level=`h2`
            &value=`[[+pattern_name]]`
            &alignment=`middle aligned`
        ]]
    </div>

    <div class="five wide right aligned column">
        <i class="unhide link icon with visibility toggle and popup"
           data-target="preview-[[+unique_idx]]"
           data-targetState="visible"
           data-content="[[%romanesco.patterns.preview_tooltip]]"
           data-position="top center"></i>
        <i class="disabled code link icon with visibility toggle and popup"
           data-target="code-[[+unique_idx]]"
           data-targetState="hidden"
           data-content="[[%romanesco.patterns.code_tooltip]]"
           data-position="top center"></i>

        [[$buttonHrefIcon?
            &classes=`small primary`
            &icon_class=`lab`
            &button_text=`Backyard`
        ]]
    </div>
</div>

<div class="ui divider"></div>

<div class="ui nested stackable doubling equal width grid">
    <div class="row">
        <div id="preview-[[+unique_idx]]" class="[[+sidebar_width]] wide column">
            [[+preview]]
        </div>
        <div id="code-[[+unique_idx]]" class="column hidden element">
            [[+code]]
        </div>
    </div>
</div>