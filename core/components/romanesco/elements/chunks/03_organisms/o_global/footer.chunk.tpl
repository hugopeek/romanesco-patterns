[[modifiedIf?
    &subject=`[[getRawTVValue? &tv=`footer_visibility`]]`
    &operator=`EQ`
    &operand=`@INHERIT default`
    &then=`[[[[#[[*parent]].footer_inheritance:contains=`inherit_visibility`:then=`*footer_visibility:replace=`default==[[++footer_visibility_default]]``:else=`++footer_visibility_default`]]]]`
    &else=`[[*footer_visibility]]`
    &toPlaceholder=`footer_visibility`
]]
[[modifiedIf?
    &subject=`[[getRawTVValue? &tv=`footer_type`]]`
    &operator=`EQ`
    &operand=`@INHERIT default`
    &then=`[[[[#[[*parent]].footer_inheritance:contains=`inherit_type`:then=`*footer_type:replace=`default==[[++global_footer_id]]``:else=`++global_footer_id`]]]]`
    &else=`[[*footer_type]]`
    &toPlaceholder=`footer_type`
]]
[[modifiedIf?
    &subject=`[[getRawTVValue? &tv=`footer_background`]]`
    &operator=`EQ`
    &operand=`@INHERIT`
    &then=`[[[[#[[*parent]].footer_inheritance:contains=`inherit_background`:then=`*footer_background:empty=`[[++footer_background_default]]``:else=`++footer_background_default`]]]]`
    &else=`[[*footer_background]]`
    &toPlaceholder=`footer_background`
]]

[[[[[[If?
    &subject=`[[getRawTVValue? &tv=`footer_cta`]]`
    &operator=`EQ`
    &operand=`@INHERIT`
    &then=`
        If?
            &subject=`inherit_cta`
            &operator=`inarray`
            &operand=`[[#[[*parent]].footer_inheritance]]`
            &then=`[[*footer_cta:notempty=`$ctaFooter`]]`
        `
    &else=`*footer_cta:notempty=`$ctaFooter``
]]]]]]

[[If? &subject=`[[+footer_visibility]]` &operator=`notempty` &then=`
<footer id="footer" class="ui vertical segment [[setBackground? &background=`[[+footer_background]]`]]">
    [[[[If?
        &subject=`[[+footer_type]]`
        &operator=`notempty`
        &then=`pdoField?
            &id=`[[+footer_type]]`
            &field=`content`
        `
    ]]]]

    [[[[modifiedIf?
        &subject=`footerCopyrightTheme`
        &operator=`iselement`
        &operand=`chunk`
        &then=`$footerCopyrightTheme`
        &else=`$footerCopyright`
    ]]]]
</footer>
`]]