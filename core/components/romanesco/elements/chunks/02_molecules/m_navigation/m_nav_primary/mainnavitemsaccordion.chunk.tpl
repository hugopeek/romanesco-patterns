<ul id="menu-accordion">
    [[!pdoMenu?
        &startId=`0`
        &level=`[[+level:empty=`[[++navbar_level]]`]]`
        &levelClass=`level-`
        &selfClass=`current`
        &resources=`[[+excluded_resources]]`

        &tplOuter=`navWrapper`
        &tpl=`navItemAccordionParent`
        &tplParentRow=`navItemAccordionParent`
        &tplParentRowActive=`navItemAccordionParent@Active`
        &tplInnerRow=`navItemAccordion`

        &checkPermissions=`list`
        &cache=`1`
        &cache_key=`[[!+modx.user.id:memberof=`[[++romanesco.member_groups_frontend]]`:then=`nav_[[*context_key]]_member`:else=`nav_[[*context_key]]_anonymous`]]`
    ]]
</ul>