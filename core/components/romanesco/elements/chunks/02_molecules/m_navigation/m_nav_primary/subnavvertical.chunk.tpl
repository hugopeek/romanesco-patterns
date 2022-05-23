<a id="submenu-header" class="ui tiny header for submenu-[[++submenu_type:stripString=`[[++sidebar_position]] `]]" href="[[~[[UltimateParent]]]]">
    [[pdoField?
        &id=`[[UltimateParent]]`
        &field=`menutitle`
        &default=`pagetitle`
    ]]
</a>
<nav id="submenu" class="ui [[++navbar_size:default=`large`]] [[++submenu_type]] vertical fluid [[+sticky:eq=`1`:then=`sticky`]] menu">
    [[pdoMenu?
        &parents=`[[UltimateParent]]`
        &resources=`[[+excluded_resources]]`
        &level=`[[++submenu_level]]`
        &tplOuter=`navWrapper`
        &tpl=`navItem`
        &tplParentRowActive=`navItemInnerWrapper`
        &tplInnerRow=`navItemInner`
        &hideSubMenus=`1`
        &countChildren=`[[++submenu_childcount]]`
    ]]
</nav>