<nav id="menu" class="ui large secondary [[++navbar_sticky:is=`1`:then=`sticky`]] menu">
    <div class="ui container">
        <div class="item branding">
            [[[[If? &subject=`[[$logoTheme]]` &operator=`isnull` &then=`$logo` &else=`$logoTheme`]]]]
        </div>

        [[[[If?
            &subject=`[[++navbar_level]]`
            &operator=`lte`
            &operand=`1`
            &then=`$mainNavItems`
            &else=`$mainNavItemsDropdown`
        ]]]]

        [[$mainNavItemsTheme]]

        <div class="item toc">
            <button class="ui right labeled icon button">
                <i class="sidebar icon"></i>
                <span>Menu</span>
            </button>
        </div>
    </div>
</nav>