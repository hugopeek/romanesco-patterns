<header id="header" class="[[++navbar_sticky:eq=`1`:then=`ui sticky`]] inverted primary-color">
    [[[[modifiedIf?
        &subject=`masthead`
        &operator=`iselement`
        &operand=`chunk`
        &then=`$masthead`
    ]]]]

    [[[[modifiedIf?
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