<header class="masthead">
    [[[[If?
        &subject=`[[+masthead]]`
        &operator=`EQ`
        &operand=`1`
        &then=`$masthead`
    ]]]]

    [[[[If?
        &subject=`[[$mainNavTheme]]`
        &operator=`isnull`
        &then=`$mainNav`
        &else=`$mainNavTheme`
    ]]]]

    [[[[If?
        &subject=`[[+hero]]`
        &operator=`EQ`
        &operand=`1`
        &then=`$hero`
    ]]]]

    [[[[If?
        &subject=`[[++romanesco.search_add_to_menu]]`
        &operator=`EQ`
        &operand=`1`
        &then=`$searchFormCompact`
    ]]]]
</header>