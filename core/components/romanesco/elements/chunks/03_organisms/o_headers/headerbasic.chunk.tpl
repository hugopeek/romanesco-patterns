[[modifiedIf?
    &subject=`[[*header_visibility]]`
    &operator=`EQ`
    &operand=`default`
    &then=`[[++header_visibility_default]]`
    &else=`[[*header_visibility]]`
    &toPlaceholder=`header_visibility`
]]
[[modifiedIf?
    &subject=`[[getRawTVValue? &tv=`header_visibility`]]`
    &operator=`contains`
    &operand=`@INHERIT`
    &then=`[[#[[*parent]].header_inheritance:contains=`inherit_visibility`:then=`[[+header_visibility]]`:else=`[[++header_visibility_default]]`]]`
    &else=`[[+header_visibility]]`
    &toPlaceholder=`hero`
]]

<header id="header" class="[[+hero:eq=`0`:then=`without hero`]] [[++navbar_sticky:eq=`0`:then=`non-stick`]]">
    [[[[modifiedIf?
        &subject=`masthead`
        &operator=`iselement`
        &operand=`chunk`
        &then=`$masthead`
    ]]]]

    [[[[modifiedIf?
        &subject=`mainNavTheme`
        &operator=`iselement`
        &operand=`chunk`
        &then=`$mainNavTheme`
        &else=`$mainNav`
    ]]]]

    [[[[If?
        &subject=`[[+hero]]`
        &operator=`EQ`
        &operand=`1`
        &then=`$hero`
    ]]]]

    [[[[If?
        &subject=`[[++search.add_to_menu]]`
        &operator=`EQ`
        &operand=`1`
        &then=`$searchForm`
    ]]]]
</header>