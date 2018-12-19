<nav id="menu" class="ui large secondary [[++navbar_sticky:is=`1`:then=`sticky`]] menu" role="navigation">
    <div class="ui container">
        <div class="item branding">
            [[[[If? &subject=`[[$logoTheme]]` &operator=`isnull` &then=`$logo` &else=`$logoTheme`]]]]
        </div>

        <div class="right menu">
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
        </div>

        [[$mainNavItemsTheme]]

        <div class="item toc">
            <button class="ui right labeled icon button">
                <i class="sidebar icon"></i>
                <span>Menu</span>
            </button>
        </div>
    </div>
</nav>