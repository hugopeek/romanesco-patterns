<a class="ui tiny header" href="[[~[[UltimateParent]]]]">
    [[pdoField?
        &id=`[[UltimateParent]]`
        &field=`menutitle`
        &default=`pagetitle`
    ]]
</a>
<nav id="submenu" class="ui large vertical fluid right tabular [[+sticky:eq=`1`:then=`sticky`]] menu">
    [[pdoMenu?
        &parents=`[[UltimateParent]]`
        &resources=`[[+excluded_resources]]`
        &level=`2`
        &tplOuter=`navWrapper`
        &tpl=`navItem`
        &tplParentRowActive=`navItemInnerWrapper`
        &tplInnerRow=`navItemInner`
        &hideSubMenus=`1`
    ]]
</nav>