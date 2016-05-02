[[If:toPlaceholder=`header_title`?
    &subject=`[[getRawTVValue? &tv=`header_title`]]`
    &operator=`EQ`
    &operand=`@INHERIT`
    &then=`[[[[#[[*parent]].header_inheritance:contains=`inherit_titles`:then=`*header_title`]]]]`
    &else=`[[*header_title]]`
]]

[[If:toPlaceholder=`header_subtitle`?
    &subject=`[[getRawTVValue? &tv=`header_subtitle`]]`
    &operator=`EQ`
    &operand=`@INHERIT`
    &then=`[[[[#[[*parent]].header_inheritance:contains=`inherit_titles`:then=`*header_subtitle`]]]]`
    &else=`[[*header_subtitle]]`
]]

[[If:toPlaceholder=`header_background`?
    &subject=`[[getRawTVValue? &tv=`header_background`]]`
    &operator=`EQ`
    &operand=`@INHERIT`
    &then=`[[[[#[[*parent]].header_inheritance:contains=`inherit_background`:then=`*header_background`]]]]`
    &else=`[[*header_background]]`
]]

[[If:toPlaceholder=`header_background_class`?
    &subject=`[[*header_background_img]]`
    &operator=`notempty`
    &then=`[[*alias]] background`
    &else=`[[+header_background_inherited:empty=`[[++header_background_default]]`]]`
]]

<div class="ui vertical stripe segment [[+header_background_class]]">
    [[If?
        &subject=`[[getRawTVValue? &tv=`header_cta`]]`
        &operator=`EQ`
        &operand=`@INHERIT`
        &then=`[[[[#[[*parent]].header_inheritance:contains=`inherit_cta`:then=`$ctaHeader`:else=`$heroTitles`]]]]`
        &else=`
        [[[[If?
            &subject=`[[getRawTVValue? &tv=`header_cta`]]`
            &operator=`isnot`
            &operand=`@INHERIT`
            &then=`$ctaHeader`
            &else=`$heroTitles`
        ]]]]`
    ]]
</div>