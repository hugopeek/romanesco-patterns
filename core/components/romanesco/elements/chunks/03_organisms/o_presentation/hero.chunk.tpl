[[modifiedIf?
    &subject=`[[getRawTVValue? &tv=`header_title`]]`
    &operator=`EQ`
    &operand=`@INHERIT`
    &then=`[[[[#[[*parent]].header_inheritance:contains=`inherit_titles`:then=`*header_title`]]]]`
    &else=`[[*header_title]]`
    &toPlaceholder=`header_title`
]]
[[modifiedIf?
    &subject=`[[getRawTVValue? &tv=`header_subtitle`]]`
    &operator=`EQ`
    &operand=`@INHERIT`
    &then=`[[[[#[[*parent]].header_inheritance:contains=`inherit_titles`:then=`*header_subtitle`]]]]`
    &else=`[[*header_subtitle]]`
    &toPlaceholder=`header_subtitle`
]]
[[If:toPlaceholder=`header_background`?
    &subject=`[[getRawTVValue? &tv=`header_background`]]`
    &operator=`EQ`
    &operand=`@INHERIT`
    &then=`[[[[#[[*parent]].header_inheritance:contains=`inherit_background`:then=`*header_background`:else=``]]]]`
    &else=`[[*header_background]]`
]]
[[modifiedIf?
    &subject=`[[*header_background_img]]`
    &operator=`notempty`
    &then=`[[*alias]] background`
    &else=`[[+header_background:empty=`[[++header_background_default]]`]]`
    &toPlaceholder=`header_background_class`
]]
[[modifiedIf?
    &subject=`heroTitlesTheme`
    &operator=`iselement`
    &operand=`chunk`
    &then=`heroTitlesTheme`
    &else=`heroTitles`
    &toPlaceholder=`hero_tpl`
]]

<div id="hero" class="ui vertical stripe segment [[setBackground? &background=`[[+header_background_class]]`]]">
    [[[[[[If?
        &subject=`[[getRawTVValue? &tv=`header_cta`]]`
        &operator=`EQ`
        &operand=`@INHERIT`
        &then=`#[[*parent]].header_inheritance:contains=`inherit_cta`:then=`$ctaHeader`:else=`$[[+hero_tpl]]``
        &else=`
        If?
            &subject=`[[getRawTVValue? &tv=`header_cta`]]`
            &operator=`isnot`
            &operand=`@INHERIT`
            &then=`$ctaHeader`
            &else=`$[[+hero_tpl]]`
        `
    ]]]]]]
</div>