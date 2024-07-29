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
        &cache_key=`nav/[[+user_access_level]]/[[*context_key]]/accordion`
    ]]
</ul>