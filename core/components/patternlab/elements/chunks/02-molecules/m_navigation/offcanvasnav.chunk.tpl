<nav id="off-canvas" class="ui right inverted vertical accordion menu sidebar">
    <div class="item home">
        <a href="[[~[[++site_start]]]]" class="ui image brand badge"></a>
        <a href="[[~[[++site_start]]]]">[[%patternlab.menu.brand]]</a>
        <button class="ui tiny compact circular basic inverted right floated close icon button" title="[[%patternlab.menu.close_title]]">
            <i class="close icon"></i>
        </button>
    </div>
    [[pdoMenu?
        &parents=`0`
        &level=`3`
        &tplOuter=`navWrapper`
        &tpl=`navItemWrapper`
        &tplParentRow=`navItemParent`
        &tplParentRowActive=`navItemParentActive`
        &tplInnerRow=`navItem`
    ]]
    [[$offCanvasNavItemsTheme]]
</nav>