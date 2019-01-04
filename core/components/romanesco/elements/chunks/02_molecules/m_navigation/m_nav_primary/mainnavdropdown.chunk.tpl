<nav id="menu" class="ui large [[++navbar_sticky:is=`1`:then=`sticky`]] menu" role="navigation">
    <div class="ui container" style="padding-left: 0;">
        <div class="item branding">
            [[[[If? &subject=`[[$logoTheme]]` &operator=`isnull` &then=`$logo` &else=`$logoTheme`]]]]
        </div>

        <ul id="menu-dropdown" class="right menu">
            [[pdoMenu?
                &startId=`0`
                &level=`3`
                &resources=`[[++navbar_resources]]`
                &tplOuter=`navWrapper`
                &tpl=`navItemDropdownParent`
                &tplParentRowActive=`navItemDropdownParentActive`
                &tplCategoryFolder=`navItemDropdownCategory`
                &tplInner=`navWrapper`
                &tplInnerRow=`navItemDropdown`
            ]]
        </ul>

        [[$mainNavItemsTheme]]

        <div class="right item toc">
            <button class="ui right labeled icon button">
                <i class="sidebar icon"></i>
                <span>Menu</span>
            </button>
        </div>
    </div>
</nav>