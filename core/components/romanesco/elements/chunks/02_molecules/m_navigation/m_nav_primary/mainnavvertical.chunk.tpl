<nav id="menu-vertical" class="ui [[++navbar_size:default=`large`]] secondary vertical [[++navbar_level:lte=`1`:then=`inverted`:else=`accordion`]] menu" role="navigation">
    <div class="item branding">
        [[$[[If? &subject=`[[$logoTheme]]` &operator=`isnull` &then=`logo` &else=`logoTheme`]]? &classes=`inverted`]]
    </div>

    [[[[If?
        &subject=`[[++navbar_level]]`
        &operator=`lte`
        &operand=`1`
        &then=`$mainNavItems`
        &else=`$mainNavItemsAccordion`
    ]]]]

    [[$mainNavItemsTheme]]

    <div class="item toc">
        <button class="ui right labeled inverted basic icon button">
            <i class="sidebar icon"></i>
            <span>[[%romanesco.menu.toc]]</span>
        </button>
    </div>
</nav>