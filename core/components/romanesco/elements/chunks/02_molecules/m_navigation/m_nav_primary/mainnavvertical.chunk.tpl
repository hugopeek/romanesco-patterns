<nav id="menu-vertical" class="ui large inverted secondary vertical accordion menu" role="navigation">
    <div class="item branding">
        [[$logo]]
    </div>

    [[!pdoMenu?
        &parents=`0`
        &level=`3`
        &tplOuter=`navWrapper`
        &tpl=`navItemWrapper`
        &tplParentRow=`navItemParent`
        &tplParentRowActive=`navItemParentActive`
        &tplInnerRow=`navItem`
        &checkPermissions=`list`
        &cache=`1`
        &cache_key=`[[!+modx.user.id:memberof=`[[++romanesco.member_groups_frontend]]`:then=`nav_member`:else=`nav_anonymous`]]`
    ]]

    [[$mainNavItemsTheme]]

    <div class="item toc">
        <button class="ui right labeled inverted basic icon button">
            <i class="sidebar icon"></i>
            <span>Menu</span>
        </button>
    </div>
</nav>