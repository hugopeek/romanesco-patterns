<div id="menu-accordion">
    [[!pdoMenu?
        &startId=`0`
        &level=`[[++navbar_level:default=`2`]]`
        &levelClass=`level-`
        &selfClass=`current`
        &resources=`[[++navbar_resources]]`

        &tplOuter=`navWrapper`
        &tpl=`navItemAccordionParent`
        &tplParentRow=`navItemAccordionParent`
        &tplParentRowActive=`navItemAccordionParent@Active`
        &tplInnerRow=`navItem`

        &checkPermissions=`list`
        &cache=`1`
        &cache_key=`[[!+modx.user.id:memberof=`[[++romanesco.member_groups_frontend]]`:then=`nav_[[*context_key]]_member`:else=`nav_[[*context_key]]_anonymous`]]`
    ]]
</div>