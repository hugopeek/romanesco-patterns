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

[[+footer_visibility:eq=`1`:then=`
<footer id="footer" class="ui vertical segment [[+footer_background]]">
    [[#[[+footer_type]].content]]

    [[[[If?
        &subject=`[[$footerCopyrightTheme]]`
        &operator=`isnull`
        &then=`$footerCopyright`
        &else=`$footerCopyrightTheme`
    ]]]]
</footer>
`]]