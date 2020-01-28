<nav id="off-canvas" class="ui right inverted vertical accordion wide sidebar menu">
    <div class="item home">
        <a href="[[~[[++site_start]]]]" class="ui image brand badge">
            [[%romanesco.menu.brand]]
        </a>
        <button class="ui basic inverted close icon button" title="[[%romanesco.menu.close_title]]">
            <i class="large close icon"></i>
        </button>
    </div>

    [[[[++navbar_level:lte=`1`:then=`
        pdoMenu?
            &parents=`0`
            &level=`3`
            &tplOuter=`navWrapper`
            &tpl=`navItemWrapper`
            &tplParentRow=`navItemParent`
            &tplParentRowActive=`navItemParentActive`
            &tplInnerRow=`navItem`
        `
    ]]]]

    [[$offCanvasNavItemsTheme]]
</nav>