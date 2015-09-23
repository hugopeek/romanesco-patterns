<nav id="menu" class="ui large secondary menu" role="navigation">
    <div class="ui container">
        [[$logo]]

        <div class="right menu">
            [[pdoMenu?
                &startId=`0`
                &level=`1`
                &tplOuter=`navWrapper`
                &tpl=`navItem`
            ]]
        </div>

        [[$navItemsTheme]]

        <div class="item toc">
            <button class="ui right labeled icon button">
                <i class="sidebar icon"></i>
                Menu
            </button>
        </div>
    </div>
</nav>