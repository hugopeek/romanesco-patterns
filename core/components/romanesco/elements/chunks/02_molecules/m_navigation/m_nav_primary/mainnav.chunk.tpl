<nav id="menu" class="ui [[++navbar_size:default=`large`]] secondary [[++navbar_sticky:is=`1`:then=`sticky`]] menu">
    <div class="ui container">
        <div class="item branding">
            [[[[If? &subject=`[[$logoTheme]]` &operator=`isnull` &then=`$logo` &else=`$logoTheme`]]]]
        </div>

        [[[[If?
            &subject=`[[++navbar_level]]`
            &operator=`lte`
            &operand=`1`
            &then=`$mainNavItems? &classes=`right menu``
            &else=`$mainNavItemsDropdown? &classes=`right menu``
        ]]]]

        [[$mainNavItemsTheme]]

        <div class="item toc">
            <button class="ui right labeled icon button">
                <i class="sidebar icon"></i>
                <span>[[%romanesco.menu.toc]]</span>
            </button>
        </div>
    </div>
</nav>