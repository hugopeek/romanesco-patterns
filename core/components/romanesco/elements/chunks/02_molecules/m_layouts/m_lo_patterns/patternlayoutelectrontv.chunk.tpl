<div class="ui two column middle aligned equal width grid">
    <div class="column">
        [[$headingBasicAnchor?
            &level=`h2`
            &value=`[[+pattern_name]]`
            &alignment=`middle aligned`
        ]]
    </div>

    <div class="five wide right aligned column">
        <i class="disabled code link icon with visibility toggle and popup"
           data-target="code-[[+unique_idx]]"
           data-targetState="hidden"
           data-content="[[%romanesco.patterns.code_tooltip]]"
           data-position="top center"></i>

        [[-$buttonHrefIcon?
            &classes=`small primary`
            &icon_class=`lab`
            &button_text=`Backyard`
        ]]
    </div>
</div>

<div class="ui hidden divider"></div>

<div id="code-[[+unique_idx]]" class="ui basic vertical segment hidden element">
    <div class="ui two column stackable grid">
        <div class="column">
            [[$codeSnippet?
                &value=`[[*[[+pattern_name]]:tag]]`
                &label=`Page`
            ]]
        </div>
        <div class="column">
            [[$codeSnippet?
                &value=`[[+[[+pattern_name]]:tag]]`
                &label=`Tpl`
            ]]
        </div>
    </div>
</div>