<nav id="menu-vertical" class="ui large inverted secondary vertical accordion menu" role="navigation">
    <div class="item branding">
        [[$logo]]
    </div>

    [[!getCache?
        &element=`pdoMenu`
        [[!++romanesco.member_groups:eq=`1`:then=`
        &cacheKey=`[[!+modx.user.id:memberof=`[[++romanesco.member_groups_frontend]]`:then=`nav_member`:else=`nav_anonymous`]]`
        `:else=``]]
    
        &parents=`0`
        &level=`3`
        &tplOuter=`navWrapper`
        &tpl=`navItemWrapper`
        &tplParentRow=`navItemParent`
        &tplParentRowActive=`navItemParentActive`
        &tplInnerRow=`navItem`
        &checkPermissions=`list`
    ]]

    [[$mainNavItemsTheme]]

    <div class="item toc">
        <button class="ui right labeled inverted basic icon button">
            <i class="sidebar icon"></i>
            <span>Menu</span>
        </button>
    </div>
</nav>