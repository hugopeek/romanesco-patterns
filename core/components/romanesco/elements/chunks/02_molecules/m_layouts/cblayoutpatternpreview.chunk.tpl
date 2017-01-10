<div class="ui nested stackable doubling equal width grid">
    <div class="row">
        <div id="preview-[[+unique_idx]]" class="[[+sidebar_width]] wide column">
            [[!getCache:toPlaceholder=`render_example`?
                &element=`cbGetFieldContent`
                &cacheKey=`pattern_library`
                [[++custom_cache:eq=`0`:then=`&cacheExpires=`1``]]

                &field=`13`
                &tpl=`rawValue`
                &fieldSettingFilter=`label==MODX`
                &limit=`1`
                &offset=`[[+idx:subtract=`1`]]`
            ]]

            [[+render_example:replace=`&amp;==&`:replace=`&#91;==[`:replace=`&#93;==]`:replace=`&#96;==``:toPlaceholder=`example`]]

            [[+example:ne=``:then=`
            <div class="slider-minimal">
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