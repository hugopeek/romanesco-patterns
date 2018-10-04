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

<footer id="footer" class="ui vertical segment [[+footer_background]]">
    [[#[[*footer_type:empty=`[[++global_footer_id:empty=`0`]]`]].content]]

    [[[[If?
        &subject=`[[$footerCopyrightTheme]]`
        &operator=`isnull`
        &then=`$footerCopyright`
        &else=`$footerCopyrightTheme`
    ]]]]
</footer>