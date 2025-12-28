<div class="ui container">
    [[If?
        &subject=`[[getRawTVValue? &tv=`sidebar_sticky`]]`
        &operator=`contains`
        &operand=`@INHERIT`
        &then=`[[#[[*parent]].sidebar_inheritance:contains=`inherit_sticky`:then=`[[*sidebar_sticky]]`:else=`[[++sidebar_sticky]]`]]`
        &else=`[[*sidebar_sticky]]`
        &toPlaceholder=`sidebar_sticky_tv`
    ]]
    [[If?
        &subject=`[[*sidebar_sticky]]`
        &operator=`is`
        &operand=`default`
        &then=`[[++sidebar_sticky]]`
        &else=`[[+sidebar_sticky_tv]]`
        &toPlaceholder=`sidebar_sticky`
    ]]

    [[[[If?
        &subject=`[[++submenu_locality]]`
        &operator=`is`
        &operand=`current`
        &then=`$subNavVerticalLocal`
        &else=`$subNavVertical`
    ]]?
        &sticky=`[[*sidebar_cta:is=``:then=`[[+sidebar_sticky:eq=`1`:then=`sticky`]]`]]`
    ]]
    [[[[If?
        &subject=`[[*sidebar_cta]]`
        &operator=`notempty`
        &then=`$ctaSidebar`
    ]]?
        &sticky=`[[+sidebar_sticky:eq=`1`:then=`sticky`]]`
    ]]
</div>