<header id="header" class="[[++navbar_sticky:eq=`1`:then=`ui sticky`]] inverted primary-color">
    [[[[If?
        &subject=`masthead`
        &operator=`iselement`
        &operand=`chunk`
        &then=`$masthead`
    ]]]]

    [[[[If?
        &subject=`mainNavVerticalTheme`
        &operator=`iselement`
        &operand=`chunk`
        &then=`$mainNavVerticalTheme`
        &else=`$mainNavVertical`
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