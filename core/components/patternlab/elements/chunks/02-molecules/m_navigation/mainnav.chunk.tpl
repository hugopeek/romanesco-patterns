<nav id="menu" class="ui large secondary [[++navbar_sticky:is=`1`:then=`sticky`]] menu" role="navigation">
    <div class="ui container">
        <div class="item branding">
            [[$logo]]
        </div>
        
        <div class="right menu">
            [[pdoMenu?
                &startId=`0`
                &level=`1`
                &resources=`[[++navbar_resources]]`
                &tplOuter=`navWrapper`
                &tpl=`navItem`
            ]]
        </div>

        [[$mainNavItemsTheme]]

        <div class="item toc">
            <button class="ui right labeled icon button">
                <i class="sidebar icon"></i>
                Menu
            </button>
        </div>
    </div>
</nav>