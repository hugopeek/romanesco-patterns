<nav id="menu" class="ui large secondary [[++navbar_sticky:is=`1`:then=`sticky`]] menu" role="navigation">
    <ul class="ui container" style="padding-left: 0;">
        <li class="item branding">
            [[[[If? &subject=`[[$logoTheme]]` &operator=`isnull` &then=`$logo` &else=`$logoTheme`]]]]
        </li>

        <ul id="menu-dropdowns" class="right menu">
            [[pdoMenu?
                &startId=`0`
                &level=`3`
                &resources=`[[++navbar_resources]]`
                &tplOuter=`navWrapper`
                &tpl=`navItemDropdownParent`
                &tplCategoryFolder=`navItemDropdownCategory`
                &tplInner=`navWrapper`
                &tplInnerRow=`navItemDropdown`
            ]]
        </ul>

        [[$mainNavItemsTheme]]

        <li class="right item toc">
            <button class="ui right labeled icon button">
                <i class="sidebar icon"></i>
                <span>Menu</span>
            </button>
        </li>
    </ul>
</nav>