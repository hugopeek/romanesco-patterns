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

        <div class="item highlight">
            [[-<a class="ui button primary" href="[[~45]]">[[#45.menutitle]]</a>
            <a class="ui button" href="[[~275]]"><i class="sign in icon"></i>[[#275.menutitle]]</a>]]
            <div class="ui buttons">
                <a class="ui secondary button" href="[[~45]]">[[#45.menutitle]]</a>
                <div class="or" data-text="of"></div>
                <a class="ui primary button" href="[[~275]]"><i class="sign in icon"></i>Inloggen</a>
            </div>
        </div>

        <a class="item toc">Menu<i class="sidebar icon"></i></a>
    </div>
</nav>