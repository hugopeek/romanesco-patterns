<header id="header" class="masthead inverted primary-color">
    [[[[If?
        &subject=`[[+masthead]]`
        &operator=`EQ`
        &operand=`1`
        &then=`$masthead`
    ]]]]

    [[[[If?
        &subject=`[[$mainNavVerticalTheme]]`
        &operator=`isnull`
        &then=`$mainNavVertical`
        &else=`$mainNavVerticalTheme`
    ]]]]

    [[[[If?
        &subject=`[[+hero]]`
        &operator=`EQ`
        &operand=`1`
        &then=`$heroVertical`
    ]]]]

    [[[[If?
        &subject=`[[++search.add_to_menu]]`
        &operator=`EQ`
        &operand=`1`
        &then=`$searchForm`
    ]]]]
</header>