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
                [[!getCache:toPlaceholder=`render_example`?
                    &element=`cbGetFieldContent`
                    &cacheKey=`pattern_library`
                    [[++custom_cache:eq=`0`:then=`&cacheExpires=`1``]]

                    &field=`13`
                    &tpl=`rawValue`
                    &limit=`1`
                    &offset=`[[+idx:subtract=`1`]]`
                ]]

                [[+render_example:replace=`&amp;==&`:replace=`&#91;==[`:replace=`&#93;==]`:replace=`&#96;==``:toPlaceholder=`example`]]

                [[+example:ne=``:then=`
                <div class="slider">
                    <div id="preview-example-[[+unique_idx]]">
                        [[+example]]
                    </div>
                    <div id="preview-code-[[+unique_idx]]">
                        [[+preview]]
                    </div>
                </div>
                `:else=`[[+preview]]`]]
        </div>

        <div id="code-[[+unique_idx]]" class="column hidden element">
            [[+code]]
        </div>
    </div>
</div>