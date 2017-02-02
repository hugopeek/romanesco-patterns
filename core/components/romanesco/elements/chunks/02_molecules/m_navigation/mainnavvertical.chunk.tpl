<nav id="menu-vertical" class="ui large secondary vertical menu" role="navigation">
    <div class="item branding">
        [[$logo]]
    </div>

    [[pdoMenu?
        &startId=`0`
        &level=`1`
        &resources=`[[++navbar_resources]]`
        &tplOuter=`navWrapper`
        &tpl=`navItem`
    ]]

    [[$mainNavItemsTheme]]

    <div class="item toc">
        <button class="ui right labeled icon button">
            <i class="sidebar icon"></i>
            Menu
        </button>
    </div>
</nav>