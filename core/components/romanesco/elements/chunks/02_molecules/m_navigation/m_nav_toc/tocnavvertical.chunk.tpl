<div id="dropdown-toc" class="ui vertical stripe segment mobile only tablet only">
    <div class="ui container">
        [[$tocNavDropdown?
            &toc_size=`[[++navbar_size]]`
            &toc_options_dropdown=`fluid`
        ]]
    </div>
</div>

<nav id="submenu" class="ui [[+size]] secondary vertical fluid right pointing [[+sticky:eq=`1`:then=`sticky`]] toc menu tablet or lower hidden">
    [[!tableOfContents? &target=`#submenu`]]
</nav>