[[pdoMenu?
    &parents=`[[*id]]`
    &level=`1`
    &tplOuter=`@INLINE [[+wrapper]]`
    &tpl=`@INLINE 1`
    &hideSubMenus=`1`
    &toPlaceholder=`has_children`
]]
[[+has_children:isnot=``:then=`[[*id]]`:else=`[[*parent]]`:toPlaceholder=`back_button_id`]]

[[[[getResourceLevel:gte=`[[++navbar_level]]`:then=`
    pdoMenu?
        &parents=`[[+has_children:is=``:then=`[[*parent:empty=`-1`]]`:else=`[[*id]]`]]`
        &resources=`[[+excluded_resources]]`
        &level=`1`
        &tplOuter=`subNavVerticalWrapper`
        &tpl=`navItem`
        &tplParentRowActive=`navItemInnerWrapper`
        &tplInner=`navWrapper`
        &tplInnerRow=`navItemInner`
        &hideSubMenus=`1`
        &countChildren=`[[++submenu_childcount]]`
    `
]]]]