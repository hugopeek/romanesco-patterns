<header class="masthead">
    [[If?
        &subject=`[[+masthead]]`
        &operator=`EQ`
        &operand=`1`
        &then=`[[$masthead]]`
    ]]

    [[If? &subject=`[[$mainNavTheme]]` &operator=`isnull` &then=`[[$mainNav]]` &else=`[[$mainNavTheme]]`]]

    [[If?
        &subject=`[[+hero]]`
        &operator=`EQ`
        &operand=`1`
        &then=`[[$hero]]`
    ]]

    [[If?
        &subject=`[[++bootquest.add_to_menu]]`
        &operator=`EQ`
        &operand=`1`
        &then=`[[$searchForm]]`
    ]]
</header>