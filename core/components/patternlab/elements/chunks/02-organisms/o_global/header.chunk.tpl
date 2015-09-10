<header id="header" class="masthead">
    [[-$masthead]]

    <div class="ui container">
        [[$mainNav]]
    </div>

    <div class="ui inverted vertical segment blue">
        [[$hero]]

        [[If?
            &subject=`[[*header_cta]]`
            &operator=`notempty`
            &then=`[[$ctaHeader]]`
        ]]
    </div>

    [[If?
        &subject=`[[++bootquest.add_to_menu]]`
        &operator=`EQ`
        &operand=`1`
        &then=`[[$searchForm]]`
    ]]
</header>