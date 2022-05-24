[[++submenu_locality:eq=`current`:then=`
<div id="submenu-header" class="ui equal width middle aligned grid">
    <div class="column">
        <div class="ui tiny header">
            [[pdoField?
                &id=`[[+back_button_id]]`
                &field=`menutitle`
                &default=`pagetitle`
            ]]
        </div>
    </div>
    [[*id:isnot=`[[UltimateParent]]`:then=`
    <div class="compact column">
        <a class="ui [[++submenu_type:containsnot=`regular`:and:containsnot=`tabular`:then=`very`]] basic icon button"
           title="[[%romanesco.submenu.level_up]]"
           href="[[~[[*parent]]]]">
            <i class="up arrow icon"></i>
        </a>
    </div>
    `]]
</div>
`]]

<nav id="submenu" class="ui [[++navbar_size:default=`large`]] [[++submenu_type]] vertical fluid [[+sticky]] menu">
    [[+wrapper]]
</nav>